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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(addTapped))
        
        title = "About recipe"
        
        let nib = UINib.init(nibName: "FoodDetailTableViewCell", bundle: nil)
        detailTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
    
    @objc func addTapped() {
        for i in presenter.recipes {
            if let url = URL(string: i.publisherUrl) {
                UIApplication.shared.open(url)
            }
        }
    }
}
extension FoodDetailViewController: FoodDetailViewProtocol {
    func refresh() {
        detailTableView.reloadData()
    }
}
extension FoodDetailViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? 1 : 15
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
    }
}


