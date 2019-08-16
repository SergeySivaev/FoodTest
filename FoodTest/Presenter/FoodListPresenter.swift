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
    
    init(view: FoodListViewProtocol) {
        self.view = view
        self.networkService = NetworkService()
        getRecipes()
        getRecipesFromRealm()
    }
    
    func getRecipes() {
        networkService.search { foodList in
            guard let array = foodList.recipes else { return }
            DispatchQueue.main.async {
                RealmService.deleteAll()
                RealmService.save(items: array)
            }
            
        }
    }
    
    func getRecipesFromRealm() {
        //достать данные из БД
        
        recipes = try? RealmService.get(Recipe.self)
        self.view.refresh()
    }
    
    func didSelectRow(indexPath: IndexPath) {
        if let recipes = recipes {
            router?.showRecipeDetail(recipe: recipes[indexPath.row])
        }
        
    }
}
