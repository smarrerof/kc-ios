//
//  DateFormatterExtensions.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/27/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func formatDate(date: String) -> Date? {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        
        return formatter.date(from: date)
        
    }
}
