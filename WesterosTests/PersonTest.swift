//
//  CharacterTest.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/6/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arya : Person!
    var tyrion : Person!

    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        let starkURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!
        
        starkHouse = House(name: "Stark",
                           sigil: starkSigil,
                           words: "Winter is coming!",
                           url: starkURL)
        lannisterHouse = House(name: "Lannister",
                               sigil: lannisterSigil,
                               words: "Hear me roar!",
                               url: lannisterURL)
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence(){
   
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName(){
        
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    
    func testPersonEquality(){
        
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
}















