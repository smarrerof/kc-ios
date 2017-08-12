//
//  Season.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/27/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit


final class Season {

    let name: String
    let releaseDate: Date
    let poster: UIImage
    let overview: String
    
    private var _episodes : Episodes
    
    
    init(name: String, releaseDate: Date, poster: UIImage, overview: String) {
        (self.name, self.releaseDate, self.poster, self.overview) = (name, releaseDate, poster, overview)
        _episodes = Episodes()
    }
}

extension Season {
    var count : Int {
        return _episodes.count
    }
    
    func add(episode: Episode){
        
        guard episode.season!.name == self.name else {
            return
        }
        
        _episodes.insert(episode)
    }
    
    // Variadic version
    func add(episodes: Episode...) {
        for episode in episodes {
            add(episode: episode)
        }
    }
    
    // Sorted [Episode]
    func sortedEpisodes() -> [Episode] {
        return _episodes.sorted()
    }
}

extension Season {
    
    private var _proxyForEquatable : String {
        return "\(name)"
    }
    
    private var _proxyForHashable: String {
        return "\(name) \(_episodes.count)"
    }
}

// MARK: - CustomStringConvertible
extension Season: CustomStringConvertible {
    
    var description: String {
        return "Season: \(name)"
    }
}

// MARK: - Equatable
extension Season: Equatable {
 
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs._proxyForEquatable == rhs._proxyForEquatable
    }
}

// MARK: - Hashable
extension Season: Hashable {
    var hashValue: Int {
        return _proxyForHashable.hashValue
    }
}

// MARK: - Comparable
extension Season : Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.releaseDate < rhs.releaseDate
    }
}

