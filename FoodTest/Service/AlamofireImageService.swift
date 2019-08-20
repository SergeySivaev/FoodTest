//
//  ImageService.swift
//  FoodTest
//
//  Created by macbook on 14/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import AlamofireImage

class AlamofireImageService {
    typealias ImageComplition = (UIImage?)->()
    
    static let imageCache = AutoPurgingImageCache(
        memoryCapacity: 100_000_000,
        preferredMemoryUsageAfterPurge: 60_000_000
    )
    
    class func loadImage(url: String, complition: @escaping ImageComplition) {
        DispatchQueue.global().async {
            guard let url = URL(string: url) else {return}
            
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    if image != nil {
                        imageCache.add(image!, withIdentifier : "\(url)" )
                        complition(image)
                    }
                }
            }
        }
    }
}
