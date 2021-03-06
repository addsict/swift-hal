//
//  halTests.swift
//  halTests
//
//  Created by Yuki Furuyama on 2015/01/01.
//  Copyright (c) 2015年 Yuki Furuyama. All rights reserved.
//

import UIKit
import XCTest
import hal

class halTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLink() {
        let json = "{\"_links\": {\"self\": { \"href\": \"/orders\" }, \"next\": { \"href\": \"/orders?page=2\" }}}"
        let hal = HAL.parse(json)
        XCTAssertEqual(hal.link("self")!.href()!, "/orders")
        XCTAssertEqual(hal.links("self")[0].href()!, "/orders")
        XCTAssertEqual((hal.links()["next"] as HALLink).href()!, "/orders?page=2")
    }
}
