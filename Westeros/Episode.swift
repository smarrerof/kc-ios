//
//  Episode.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/28/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation


final class Episode {
    
    let name: String
    let airDate: Date
    let season: Season
    
    init(name: String, airDate: Date, season: Season) {
        (self.name, self.airDate, self.season) = (name, airDate, season)
    }
}

extension Episode {
    
    private var _proxyForEquatable : String {
        return "\(name) \(season.name)"
    }
    
    private var _proxyForHashable: String {
        return "\(name) \(season.name)"
    }    
}

// MARK: - CustomStringConvertible
extension Episode: CustomStringConvertible {
    
    var description: String {
        return "Episode: \(name)"
    }
}

// MARK: - Equatable
extension Episode: Equatable {
    
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs._proxyForEquatable == rhs._proxyForEquatable
    }
}

// MARK: - Hashable
extension Episode: Hashable {
    var hashValue: Int {
        return _proxyForHashable.hashValue
    }
}

// MARK: - Comparable
extension Episode : Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.airDate < rhs.airDate
    }
}


