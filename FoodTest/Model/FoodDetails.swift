//
//  FoodDetails.swift
//  FoodTest
//
//  Created by macbook on 13/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import Foundation

class FoodDetails: Decodable {
    let recipe: RecipeDetail?
}

class RecipeDetail: Decodable {
    
    var publisher: String?
    var fTwofUrl: String?
    var ingredients: [String]?
    var sourceUrl: String?
    var recipeId: String?
    var imageUrl: String?
    var socialRank: Int?
    var publisherUrl: String?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case fTwofUrl = "f2f_url"
        case sourceUrl = "source_url"
        case recipeId = "recipe_id"
        case imageUrl = "image_url"
        case socialRank = "social_rank"
        case publisherUrl = "publisher_url"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.fTwofUrl = try container.decode(String.self, forKey: .fTwofUrl)
        self.sourceUrl = try container.decode(String.self, forKey: .sourceUrl)
        self.recipeId = try container.decode(String.self, forKey: .recipeId)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.socialRank = try container.decode(Int.self, forKey: .socialRank)
        self.publisherUrl = try container.decode(String.self, forKey: .publisherUrl)
        }
    }

