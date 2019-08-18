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
    
    let sectionsHeaders = ["Photo", "Recipe"]
    
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
    //////////////////////
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 256.0 : 64
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.0 : 48
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsHeaders[section]
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = .gray
//        return headerView
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return presenter.recipes.count
        return section == 0 ? 1 : 25
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FoodDetailTableViewCell
            
            let recipe = presenter.recipes[indexPath.row]
            
            
            cell.configur(param: recipe)
            
            return cell
            
        } else {
            let cell = UITableViewCell()
            
            cell.selectionStyle = .none
            return cell
        }
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FoodDetailTableViewCell
//
//        let recipe = presenter.recipes[indexPath.row]
//
//
//
//        let image = recipe.imageUrl
//        ImageManager.loadImage(url: image) {[weak self] (image) in
//            guard let self = self else {return}
//            guard let i = image else {return}
//            cell.photoImageView.image = i
//        }
//
//        cell.configur(param: recipe)
//
//        return cell
    }
}


