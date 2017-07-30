//
//  DateExtensions.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/30/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

extension Date {
    
    static func fromString(date: String) -> Date? {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        
        return formatter.date(from: date)
        
    }
    
    func toString() -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        
        return formatter.string(from: self)
    }
}

