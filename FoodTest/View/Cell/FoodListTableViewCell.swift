//
//  FoodListTableViewCell.swift
//  FoodTest
//
//  Created by macbook on 14/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class FoodListTableViewCell: UITableViewCell {
    @IBOutlet weak var avaImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avaImageView.layer.cornerRadius = 30
        avaImageView.clipsToBounds = true
        rankLabel.layer.cornerRadius = 5
        rankLabel.clipsToBounds = true
    }
    
    func configur(param: Recipe) {
        let title = param.title
        titleLabel.text = title
        
        let publisher = param.publisher
        publisherLabel.text = publisher
        
        let rank = param.socialRank
        rankLabel.text = String("⭐️ \(rank)")
        
        let image = param.imageUrl
        
        if let image = AlamofireImageService.imageCache.image(withIdentifier: image) {
            self.avaImageView.image = image
        } else {
            AlamofireImageService.loadImage(url: image) {[weak self] (image) in
                guard let self = self else {return}
                self.avaImageView.image = image
            }
        }
    }
}
