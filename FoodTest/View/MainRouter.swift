//
//  MainRouter.swift
//  FoodTest
//
//  Created by macbook on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit


protocol RouterProtocol: class {
    var navigationController: UINavigationController { get set }
    func showRecipeDetail(recipe: Recipe)
}

class MainRouter: RouterProtocol {
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func showRecipeDetail(recipe: Recipe) {
        let vc = FoodDetailViewController()
        vc.presenter = FoodDetailPresenter(view: vc)
        vc.presenter.recipes.append(recipe)
        
        self.navigationController.pushViewController(vc, animated: true)
        
    }
}
