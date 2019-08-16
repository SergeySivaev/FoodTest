//
//  FoodDetailTableViewCell.swift
//  FoodTest
//
//  Created by macbook on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class FoodDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configur(param: Recipe) {
        
        let title = param.title
        nameLabel.text = title
        
        let image = param.imageUrl
        
        ImageManager.loadImage(url: image) {[weak self] (image) in
            guard let self = self else {return}
            self.photoImageView.image = image
        }
    }
}
