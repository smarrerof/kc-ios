//
//  SeasonTests.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/27/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonCreation() {
        
        XCTAssertNotNil(Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!))
    }
    
    func testSeasonCustomStringConvertible() {
        
        let season = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        XCTAssertEqual(season.description, "Season: Season 1")
        
        XCTAssertNotEqual(season.description, season.name)
    }
    
    func testSeasonEquatable() {
        
        let lhs = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        var rhs = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        XCTAssertEqual(lhs, rhs)
        
        rhs = Season(name: "Season 2", releaseDate: DateFormatter.formatDate(date: "2012/04/01")!)
        
        XCTAssertNotEqual(lhs, rhs)
    }
    
    func testSeasonHashable() {
        
        let season = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        XCTAssertNotNil(season.hashValue)
    }
    
    func testSeasonComparison() {
        
        let lhs = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        let rhs = Season(name: "Season 2", releaseDate: DateFormatter.formatDate(date: "2012/04/01")!)
        
        XCTAssertLessThan(lhs, rhs)
    }
    
    func testSeasonAddEpisodes() {
        
        let season = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        XCTAssertEqual(season.count, 0)
        
        season.add(episode: "1")
        XCTAssertEqual(season.count, 1)
        
        season.add(episode: "2")
        XCTAssertEqual(season.count, 2)
        
        season.add(episode: "2")
        XCTAssertEqual(season.count, 2)
    }
}
