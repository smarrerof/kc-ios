//
//  HouseFactory.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/28/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation


protocol HouseFactory {
    
    typealias HouseFilter = (House) -> Bool
    
    var houses: [House] { get }
    
    func house(named: String) -> House?
    
    func houses(filteredBy: HouseFilter) -> [House]
}

extension LocalFactory : HouseFactory {
    
    var houses: [House] {
        get {
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Three headed dragon")
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            let stark = House(name: "Stark",
                              sigil: starkSigil,
                              words: "Winter is coming!",
                              url: starkURL)
            let lannister = House(name: "Lannister",
                                  sigil: lannisterSigil,
                                  words: "Hear me roar!",
                                  url: lannisterURL)
            let targaryen = House(name: "Targaryen",
                                  sigil: targaryenSigil,
                                  words: "Fire & Blood",
                                  url: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark, photo: #imageLiteral(resourceName: "robbStark.png"))
            let sansa = Person(name: "Sansa", house: stark, photo: #imageLiteral(resourceName: "sansaStark.png"))
            let arya = Person(name: "Arya", house: stark, photo: #imageLiteral(resourceName: "aryaStark.png"))
            let bran = Person(name: "Bran", house: stark, photo: #imageLiteral(resourceName: "branStark.png"))
            let rickon = Person(name: "Rickon", house: stark, photo: #imageLiteral(resourceName: "rickonStark.png"))
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister, photo: #imageLiteral(resourceName: "tyrionLannister.jpg"))
            let jaime = Person(name: "Jaime", alias: "Kingslayer", house: lannister, photo: #imageLiteral(resourceName: "jaimeLannister.png"))
            let cersei = Person(name: "Cersei", house: lannister, photo: #imageLiteral(resourceName: "cerseiLannister.png"))
            
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen, photo: #imageLiteral(resourceName: "daenerysTargaryen.png"))
            
            // Añadir los personajes a las casas
            stark.add(persons: robb, sansa, arya, bran, rickon)
            lannister.add(persons: tyrion, jaime, cersei)
            targaryen.add(person: dani)
            
            return [stark, lannister, targaryen].sorted()
        }
    }
    
    func house(named: String) -> House? {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
}
