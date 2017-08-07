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
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        XCTAssertNotNil(Episode(name: "Winter is coming", airDate: Date.fromString(date: "2011/05/09")!, season: season))
    }
    
    func testEpisodeCustomStringConvertible() {
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        let episode = Episode(name: "Winter is coming", airDate: Date.fromString(date: "2011/05/09")!, season: season)
        
        XCTAssertEqual(episode.description, "Episode: \(episode.name)")
        
        XCTAssertNotEqual(episode.description, episode.name)
    }
    
    func testEpisodeEquatable() {
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        let lhs = Episode(name: "Winter is coming", airDate: Date.fromString(date: "2011/05/09")!, season: season)
        
        var rhs = Episode(name: "Winter is coming", airDate: Date.fromString(date: "2011/05/09")!, season: season)
        
        XCTAssertEqual(lhs, rhs)
        
        rhs = Episode(name: "The Kingsroad", airDate: Date.fromString(date: "2011/05/16")!, season: season)
        
        XCTAssertNotEqual(lhs, rhs)
    }
    
    func testEpisodeHashable() {
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        let episode = Episode(name: "Winter is coming", airDate: Date.fromString(date: "2011/05/09")!, season: season)
        
        XCTAssertNotNil(episode.hashValue)
    }
    
    func testEpisodeComparison() {
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        let lhs = Episode(name: "Winter is coming", airDate: Date.fromString(date: "2011/05/09")!, season: season)
        
        let rhs = Episode(name: "The Kingsroad", airDate: Date.fromString(date: "2011/05/16")!, season: season)
        
        XCTAssertLessThan(lhs, rhs)
    }
}
