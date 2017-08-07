//
//  Episode.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/28/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit


final class Episode {
    
    let name: String
    let overview: String
    let airDate: Date
    let poster: UIImage
    let season: Season
    
    init(name: String, overview: String, airDate: Date, poster: UIImage, season: Season) {
        (self.name, self.overview, self.airDate, self.poster, self.season) = (name, overview, airDate, poster, season)
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


