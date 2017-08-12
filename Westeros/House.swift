//
//  House.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/6/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit


final class House {
    
    let name    : String
    let sigil   : Sigil
    let words   : Words
    let wikiURL : URL
    
    private var _members : Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, url)
        _members = Members()
    }
}

extension House {
    var count : Int {
        return _members.count
    }
    
    func add(person: Person) {
        
        guard person.house!.name == self.name else {
            return
        }
        
        _members.insert(person)
    }
    
    // Variadic version
    func add(persons: Person...) {
        for person in persons {
            add(person: person)
        }
    }
    
    // Sorted [Person]
    func sortedMembers() -> [Person] {
        return _members.sorted()
    }
}

extension House {
    var proxyForEquality : String {
        get {
            return "\(name) \(words) \(count)"
        }
    }
    
    var proxyForComparison : String {
        get {
            return name.uppercased()
        }
    }
}



// MARK: - Equatable
extension House : Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
  
}

// MARK: - Hashable
extension House : Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension House : Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}






















