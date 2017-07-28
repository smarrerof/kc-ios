//
//  EpisodeTests.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/28/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeCreation() {
        let season = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        XCTAssertNotNil(Episode(name: "Winter is coming", airDate: DateFormatter.formatDate(date: "2011/05/09")!, season: season))
    }
    
    func testEpisodeCustomStringConvertible() {
        let season = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        let episode = Episode(name: "Winter is coming", airDate: DateFormatter.formatDate(date: "2011/05/09")!, season: season)
        
        XCTAssertEqual(episode.description, "Episode: \(episode.name)")
        
        XCTAssertNotEqual(episode.description, episode.name)
    }
    
    func testEpisodeEquatable() {
        let season = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        let lhs = Episode(name: "Winter is coming", airDate: DateFormatter.formatDate(date: "2011/05/09")!, season: season)
        
        var rhs = Episode(name: "Winter is coming", airDate: DateFormatter.formatDate(date: "2011/05/09")!, season: season)
        
        XCTAssertEqual(lhs, rhs)
        
        rhs = Episode(name: "The Kingsroad", airDate: DateFormatter.formatDate(date: "2011/05/16")!, season: season)
        
        XCTAssertNotEqual(lhs, rhs)
    }
    
    func testEpisodeHashable() {
        
        let season = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        let episode = Episode(name: "Winter is coming", airDate: DateFormatter.formatDate(date: "2011/05/09")!, season: season)
        
        XCTAssertNotNil(episode.hashValue)
    }
    
    func testEpisodeComparison() {
        
        let season = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        
        let lhs = Episode(name: "Winter is coming", airDate: DateFormatter.formatDate(date: "2011/05/09")!, season: season)
        
        let rhs = Episode(name: "The Kingsroad", airDate: DateFormatter.formatDate(date: "2011/05/16")!, season: season)
        
        XCTAssertLessThan(lhs, rhs)
    }
}
