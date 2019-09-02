//
//  FoodList.swift
//  FoodTest
//
//  Created by macbook on 13/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import Foundation
import RealmSwift

class FoodList: Decodable {
    var count: Int = 0
    var recipes: [Recipe]?
    
}
@objcMembers
class Recipe: Object, Decodable {
    
    dynamic var publisher: String = ""
    dynamic var fTwofUrl: String = ""
    dynamic var title: String = ""
    dynamic var sourceUrl: String = ""
    dynamic var recipeId: String = ""
    dynamic var imageUrl: String = ""
    dynamic var socialRank: Double = 0.0
    dynamic var publisherUrl: String = ""
    
    enum CodingKeys: String, CodingKey {
        case publisher
        case fTwofUrl = "f2f_url"
        case title
        case sourceUrl = "source_url"
        case recipeId = "recipe_id"
        case imageUrl = "image_url"
        case socialRank = "social_rank"
        case publisherUrl = "publisher_url"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.publisher = try container.decode(String.self, forKey: .publisher)
        self.fTwofUrl = try container.decode(String.self, forKey: .fTwofUrl)
        self.title = try container.decode(String.self, forKey: .title)
        self.sourceUrl = try container.decode(String.self, forKey: .sourceUrl)
        self.recipeId = try container.decode(String.self, forKey: .recipeId)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.socialRank = try container.decode(Double.self, forKey: .socialRank)
        self.publisherUrl = try container.decode(String.self, forKey: .publisherUrl)
    }
    
    override static func primaryKey() -> String? {
        return "title"
    }
    
}

