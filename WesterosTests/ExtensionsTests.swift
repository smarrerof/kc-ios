//
//  ExtensionsTests.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/30/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class ExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDateFromString() {
        
        var date = Date.fromString(date: "yyyy/MM/dd")
        
        XCTAssertNil(date)
        
        date = Date.fromString(date: "2001/12/31")
        
        XCTAssertNotNil(date)
        
        let calendar = Calendar(identifier: .gregorian)
        XCTAssertEqual(calendar.component(.day, from: date!), 31)
        XCTAssertEqual(calendar.component(.month, from: date!), 12)
        XCTAssertEqual(calendar.component(.year, from: date!), 2001)
    }
    
    func testDateToString() {
        
        let date = Date.fromString(date: "2001/12/31")
        
        XCTAssertEqual(date!.toString(),"2001/12/31")
    }
}
