//
//  FoodListViewControllerTests.swift
//  FoodTestTests
//
//  Created by macbook on 02/09/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import XCTest
@testable import FoodTest

class FoodListViewControllerTests: XCTestCase {
    
    var sut: FoodListViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenViewIsLoadedTableViewNotNil() {
        
        XCTAssertNotNil(sut.listTableView)
        
    }

}
