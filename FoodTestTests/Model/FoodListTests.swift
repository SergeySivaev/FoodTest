//
//  FoodListTests.swift
//  FoodTestTests
//
//  Created by macbook on 02/09/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import XCTest
@testable import FoodTest

class FoodListTests: XCTestCase {
    
    func test_publisher_is_equal() {
        let recipe = Recipe()
        recipe.publisher = "Foo"
        XCTAssertEqual(recipe.publisher, "Foo")
    }
    
    func test_fTwofUrl_is_equal() {
        let recipe = Recipe()
        recipe.fTwofUrl = "Foo"
        XCTAssertEqual(recipe.fTwofUrl, "Foo")
    }
    
    func test_title_is_equal() {
        let recipe = Recipe()
        recipe.title = "Foo"
        XCTAssertEqual(recipe.title, "Foo")
    }
    
    func test_sourceUrl_is_equal() {
        let recipe = Recipe()
        recipe.sourceUrl = "Foo"
        XCTAssertEqual(recipe.sourceUrl, "Foo")
    }
    
    func test_recipeId_is_equal() {
        let recipe = Recipe()
        recipe.recipeId = "Foo"
        XCTAssertEqual(recipe.recipeId, "Foo")
    }
    
    func test_imageUrl_is_equal() {
        let recipe = Recipe()
        recipe.imageUrl = "Foo"
        XCTAssertEqual(recipe.imageUrl, "Foo")
    }
    
    func test_socialRank_is_equal() {
        let recipe = Recipe()
        recipe.socialRank = 0.1
        XCTAssertEqual(recipe.socialRank, 0.1)
    }
    
    func test_publisherUrl_is_equal() {
        let recipe = Recipe()
        recipe.publisherUrl = "Foo"
        XCTAssertEqual(recipe.publisherUrl, "Foo")
    }
    
    
    func test_json_is_equal() {
        let json = """
{
    "count": 1,
    "recipes": [
        {
            "publisher": "The Pioneer Woman",
            "f2f_url": "http://food2fork.com/view/47024",
            "title": "Perfect Iced Coffee",
            "source_url": "http://thepioneerwoman.com/cooking/2011/06/perfect-iced-coffee/",
            "recipe_id": "47024",
            "image_url": "http://static.food2fork.com/icedcoffee5766.jpg",
            "social_rank": 100.0,
            "publisher_url": "http://thepioneerwoman.com"
        }
    ]
}
""".data(using: .utf8)
        
        let recipe = try! JSONDecoder().decode(FoodList.self, from: json!)
        XCTAssertEqual(recipe.recipes?.first?.publisher, "The Pioneer Woman")
        XCTAssertEqual(recipe.recipes?.first?.fTwofUrl, "http://food2fork.com/view/47024")
        XCTAssertEqual(recipe.recipes?.first?.title, "Perfect Iced Coffee")
        XCTAssertEqual(recipe.recipes?.first?.sourceUrl, "http://thepioneerwoman.com/cooking/2011/06/perfect-iced-coffee/")
        XCTAssertEqual(recipe.recipes?.first?.recipeId, "47024")
        XCTAssertEqual(recipe.recipes?.first?.imageUrl, "http://static.food2fork.com/icedcoffee5766.jpg")
        XCTAssertEqual(recipe.recipes?.first?.socialRank, 100.0)
        XCTAssertEqual(recipe.recipes?.first?.publisherUrl, "http://thepioneerwoman.com")

    }
}
