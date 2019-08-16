//
//  ImageService.swift
//  FoodTest
//
//  Created by macbook on 14/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ImageManager {
    typealias ImageComplition = (UIImage?)->()
    
    class func loadImage(url: String, complition: @escaping ImageComplition) {
        DispatchQueue.global().async {
            guard let url = URL(string: url) else {return}
            
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    complition(image)
                }
            }
        }
    }
}
