//
//  FoodDetailViewController.swift
//  FoodTest
//
//  Created by macbook on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var presenter: FoodDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "FoodDetailTableViewCell", bundle: nil)
        detailTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
}
extension FoodDetailViewController: FoodDetailViewProtocol {
    func refresh() {
        print("done FoodDetail")
        
    }
}
extension FoodDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.recipes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FoodDetailTableViewCell
        
        let recipe = presenter.recipes[indexPath.row]
        
        cell.configur(param: recipe)
        
        return cell
    }
}


