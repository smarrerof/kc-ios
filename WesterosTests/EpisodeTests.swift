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
    
    var seasons: Seasons!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        seasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeCreation() {
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        XCTAssertNotNil(Episode(name: "Winter Is Coming", overview: "Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.", airDate: Date.fromString(date: "2011/04/17")!, poster:#imageLiteral(resourceName: "episode1x01.jpg"), season: season))
    }
    
    func testEpisodeCustomStringConvertible() {
        
        let season = seasons[0]
        let episode = season.sortedEpisodes()[0]

        XCTAssertEqual(episode.description, "Episode: \(episode.name)")
        
        XCTAssertNotEqual(episode.description, episode.name)
    }
    
    func testEpisodeEquatable() {
        
        let season = seasons[0]
        
        let lhs = season.sortedEpisodes()[0]
        
        var rhs = Episode(name: "Winter Is Coming", overview: "Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.", airDate: Date.fromString(date: "2011/04/17")!, poster:#imageLiteral(resourceName: "episode1x01.jpg"), season: season)
        
        XCTAssertEqual(lhs, rhs)
        
        rhs = season.sortedEpisodes()[1]
        
        XCTAssertNotEqual(lhs, rhs)
    }
    
    func testEpisodeHashable() {
        
        let season = seasons[0]
        let episode = season.sortedEpisodes()[0]
        
        XCTAssertNotNil(episode.hashValue)
    }
    
    func testEpisodeComparison() {
        
        let season = seasons[0]
        
        let lhs = season.sortedEpisodes()[0]
        
        let rhs = season.sortedEpisodes()[1]
        
        XCTAssertLessThan(lhs, rhs)
    }
}
