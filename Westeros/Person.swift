//
//  Character.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/6/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Person {
    
    let name: String
    weak var house: House?
    private let _alias: String?
    let photo: UIImage
    
    var alias : String {
        return _alias ?? ""
    }
    
    init(name: String, alias: String?, house: House, photo: UIImage) {
        
        self.name = name
        _alias = alias
        self.house = house
        self.photo = photo;
    }
    
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house, photo: #imageLiteral(resourceName: "nophoto.png"))
    }
    
    convenience init(name: String, alias: String, house: House) {
        self.init(name: name, alias: alias, house: house, photo: #imageLiteral(resourceName: "nophoto.png"))
    }
    
    convenience init(name: String, house: House, photo: UIImage) {
        self.init(name: name, alias: nil, house: house, photo: photo)
    }
}


extension Person {
    
    var fullName : String {
        return "\(name) \(house!.name)"
    }
}

extension Person {
    var proxy : String {
        return "\(name) \(alias) \(house!.name)"
    }
}

extension Person : Hashable {
    var hashValue : Int {
        return proxy.hashValue
    }
}

extension Person : Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person : Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
