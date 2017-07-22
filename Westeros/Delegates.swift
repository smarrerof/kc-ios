//
//  Delegates.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/22/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Delegates {
    
    static func housesDelegate(model: [House]) -> ArrayDelegate<House> {
        
        return ArrayDelegate(model: model, selectRow: { (house: House, tableView: UITableView, navigationController: UINavigationController?) -> Bool in
            
            // La mostramos
            let houseVC = HouseViewController(model: house)
            navigationController?.pushViewController(houseVC, animated: true)
            
            return true
        })
        
    }
}
