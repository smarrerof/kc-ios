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
    
    func testSeasonCreation() {
        
        XCTAssertNotNil(Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring."))
    }
    
    
    func testSeasonCustomStringConvertible() {
        
        let season = seasons[0]
        
        XCTAssertEqual(season.description, "Season: Season 1")
        
        XCTAssertNotEqual(season.description, season.name)
    }
    
    func testSeasonEquatable() {
        
        let lhs = seasons[0]
        var rhs = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        XCTAssertEqual(lhs, rhs)
        
        rhs = seasons[1]
        
        XCTAssertNotEqual(lhs, rhs)
    }
    
    func testSeasonHashable() {
        
        let season = seasons[0]
        
        XCTAssertNotNil(season.hashValue)
    }
    
    func testSeasonComparison() {
        
        let lhs = seasons[0]
        
        let rhs = seasons[1]
        
        XCTAssertLessThan(lhs, rhs)
    }
    
    func testSeasonAddEpisodes() {
        
        let season1 = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        let episode1x01 = Episode(name: "Winter Is Coming", overview: "Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.", airDate: Date.fromString(date: "2011/04/17")!, poster:#imageLiteral(resourceName: "episode1x01.jpg"), season: season1)
        
        let episode1x02 = Episode(name: "The Kingsroad", overview: "While Bran recovers from his fall, Ned takes only his daughters to Kings Landing. Jon Snow goes with his uncle Benjen to The Wall. Tyrion joins them.", airDate: Date.fromString(date: "2011/04/24")!, poster:#imageLiteral(resourceName: "episode1x02.jpg"), season: season1)
        
        let season2 = Season(name: "Season 2", releaseDate: Date.fromString(date: "2012/04/01")!, poster: #imageLiteral(resourceName: "season2.jpg"), overview: "The cold winds of winter are rising in Westeros...war is coming...and five kings continue their savage quest for control of the all-powerful Iron Throne. With winter fast approaching, the coveted Iron Throne is occupied by the cruel Joffrey, counseled by his conniving mother Cersei and uncle Tyrion. But the Lannister hold on the Throne is under assault on many fronts. Meanwhile, a new leader is rising among the wildings outside the Great Wall, adding new perils for Jon Snow and the order of the Night's Watch.")
        
        let episode2x01 = Episode(name: "The North Remembers", overview: "As Robb Stark and his northern army continue the war against the Lannisters, Tyrion arrives in King’s Landing to counsel Joffrey and temper the young king’s excesses.  On the island of Dragonstone, Stannis Baratheon plots an invasion to claim his late brother’s throne, allying himself with the fiery Melisandre, a strange priestess of a stranger god.  Across the sea, Daenerys, her three young dragons, and the khalasar trek through the Red Waste in search of allies, or water.  In the North, Bran presides over a threadbare Winterfell, while beyond the Wall, Jon Snow and the Night’s Watch must shelter with a devious wildling.", airDate: Date.fromString(date: "2012/04/01")!, poster:#imageLiteral(resourceName: "episode2x01.jpg"), season: season2)
        
        XCTAssertEqual(season1.count, 0)
        
        season1.add(episode: episode1x01)
        XCTAssertEqual(season1.count, 1)
        
        season1.add(episode: episode1x02)
        XCTAssertEqual(season1.count, 2)
        
        season1.add(episode: episode1x02)
        XCTAssertEqual(season1.count, 2)
        
        season1.add(episode: episode2x01)
        XCTAssertEqual(season1.count, 2)
    }
}
