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
    }
    
    func configur(param: Recipe) {
        let title = param.title
        nameLabel.text = title
        
        let image = param.imageUrl
        
        if let image = AlamofireImageService.imageCache.image(withIdentifier: image) {
            self.photoImageView.image = image
        } else {
            print("Не удалось достать данные")
        }
    }
}
