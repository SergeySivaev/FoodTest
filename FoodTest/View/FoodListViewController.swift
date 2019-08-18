//
//  ViewController.swift
//  FoodTest
//
//  Created by macbook on 13/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class FoodListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var presenter: FoodListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Recipes"
        
        let nib = UINib.init(nibName: "FoodListTableViewCell", bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
  
    }
}
extension FoodListViewController: FoodListViewProtocol {
    func refresh() {
    }

}
extension FoodListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FoodListTableViewCell,
            let recipes = presenter.recipes?[indexPath.row] else { return UITableViewCell() }
        
        cell.configur(param: recipes)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

