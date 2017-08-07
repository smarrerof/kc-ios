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
        
        XCTAssertNotNil(Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring."))
    }
    
    
    func testSeasonCustomStringConvertible() {
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        XCTAssertEqual(season.description, "Season: Season 1")
        
        XCTAssertNotEqual(season.description, season.name)
    }
    
    func testSeasonEquatable() {
        
        let lhs = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        var rhs = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        XCTAssertEqual(lhs, rhs)
        
        rhs = Season(name: "Season 2", releaseDate: Date.fromString(date: "2012/04/01")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "The cold winds of winter are rising in Westeros...war is coming...and five kings continue their savage quest for control of the all-powerful Iron Throne. With winter fast approaching, the coveted Iron Throne is occupied by the cruel Joffrey, counseled by his conniving mother Cersei and uncle Tyrion. But the Lannister hold on the Throne is under assault on many fronts. Meanwhile, a new leader is rising among the wildings outside the Great Wall, adding new perils for Jon Snow and the order of the Night's Watch.")
        
        XCTAssertNotEqual(lhs, rhs)
    }
    
    func testSeasonHashable() {
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        XCTAssertNotNil(season.hashValue)
    }
    
    func testSeasonComparison() {
        
        let lhs = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        let rhs = Season(name: "Season 2", releaseDate: Date.fromString(date: "2012/04/01")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "The cold winds of winter are rising in Westeros...war is coming...and five kings continue their savage quest for control of the all-powerful Iron Throne. With winter fast approaching, the coveted Iron Throne is occupied by the cruel Joffrey, counseled by his conniving mother Cersei and uncle Tyrion. But the Lannister hold on the Throne is under assault on many fronts. Meanwhile, a new leader is rising among the wildings outside the Great Wall, adding new perils for Jon Snow and the order of the Night's Watch.")
        
        XCTAssertLessThan(lhs, rhs)
    }
    
    func testSeasonAddEpisodes() {
        
        let season = Season(name: "Season 1", releaseDate: Date.fromString(date: "2011/05/09")!, poster: #imageLiteral(resourceName: "season1.jpg"), overview: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        
        let episode1 = Episode(name: "Winter is coming", airDate: Date.fromString(date: "2011/05/09")!, season: season)
        
        let episode2 = Episode(name: "The Kingsroad", airDate: Date.fromString(date: "2011/05/16")!, season: season)
        
        XCTAssertEqual(season.count, 0)
        
        season.add(episode: episode1)
        XCTAssertEqual(season.count, 1)
        
        season.add(episode: episode2)
        XCTAssertEqual(season.count, 2)
        
        season.add(episode: episode2)
        XCTAssertEqual(season.count, 2)
    }
}
