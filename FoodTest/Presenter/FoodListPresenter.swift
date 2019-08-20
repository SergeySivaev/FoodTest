//
//  FoodListPresenter.swift
//  FoodTest
//
//  Created by macbook on 14/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import Foundation
import RealmSwift

protocol FoodListViewProtocol: class {
    func refresh()
}

class FoodListPresenter {
    var networkService: NetworkService!
    var view: FoodListViewProtocol!
    var recipes: Results<Recipe>?
    var router: RouterProtocol?
    var notificationToken: NotificationToken?
    var imagePath: NSString?
    
    init(view: FoodListViewProtocol) {
        self.view = view
        self.networkService = NetworkService()
        getRecipes()
    }
    
    func getRecipes() {
        networkService.search { [weak self] foodList  in
            guard let self = self else { return }
            guard let array = foodList?.recipes else { return }
            DispatchQueue.main.async {
                RealmService.deleteAll()
                RealmService.save(items: array)
                self.getRecipesFromRealm()
            }
        }
    }
    
    func getRecipesFromRealm() {
        self.recipes = try? RealmService.get(Recipe.self)
        
        notificationToken = recipes?.observe { [weak self] changes in
            guard let self = self else { return }
            switch changes {
            case .initial(_):
                self.view.refresh()
            case .update(_, _, _, _): break
            case .error(_): break
            }
        }
    }
    
    func didSelectRow(indexPath: IndexPath) {
        if let recipes = recipes {
            router?.showRecipeDetail(recipe: recipes[indexPath.row])
        }
    }
}
