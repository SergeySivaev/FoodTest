//
//  FoodDetailPresenter.swift
//  FoodTest
//
//  Created by macbook on 14/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import Foundation

protocol FoodDetailViewProtocol: class {
    func refresh()
}

class FoodDetailPresenter {
    var networkServise: NetworkService!
    var view: FoodDetailViewProtocol!
    var recipes: [Recipe] = []
    
    init(view: FoodDetailViewProtocol) {
        self.view = view
        self.networkServise = NetworkService()
    }
}
