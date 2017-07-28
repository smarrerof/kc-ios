//
//  SeasonFactory.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/28/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation


protocol SeasonFactory {
    
    typealias SeasonFilter = (Season) -> Bool
    
    var seasons: [Season] { get }
    
    func season(named: String) -> Season?
    
    func seasons(filteredBy: SeasonFilter) -> [Season]
}

extension LocalFactory: SeasonFactory {
    var seasons: [Season] {
        // Seasons
        let season1 = Season(name: "Season 1", releaseDate: DateFormatter.formatDate(date: "2011/05/09")!)
        let season2 = Season(name: "Season 2", releaseDate: DateFormatter.formatDate(date: "2012/04/01")!)
        
        // Episodes
        let episode1x01 = Episode(name: "Winter is coming", airDate: DateFormatter.formatDate(date: "2011/05/09")!, season: season1)
        
        let episode1x02 = Episode(name: "The Kingsroad", airDate: DateFormatter.formatDate(date: "2011/05/16")!, season: season1)
        
        let episode2x01 = Episode(name: "The North remembers", airDate: DateFormatter.formatDate(date: "2012/04/01")!, season: season1)
        
        let episode2x02 = Episode(name: "The Night Lands", airDate: DateFormatter.formatDate(date: "2012/04/08")!, season: season1)
        
        season1.add(episodes: episode1x01, episode1x02)
        season2.add(episodes: episode2x01, episode2x02)
        
        return [season1, season2].sorted()
    }
    
    func season(named: String) -> Season? {
        let season = seasons.filter{$0.name.uppercased() == named.uppercased()}.first
        return season
    }
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }

    
}
