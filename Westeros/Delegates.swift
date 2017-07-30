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
        
        return ArrayDelegate(model: model, selectRow: { (house: House, tableView: UITableView, controller: UITableViewController?) -> Void in
            
            // La mostramos
            let houseVC = HouseViewController(model: house)
            controller?.navigationController?.pushViewController(houseVC, animated: true)
        })
    }
    
    static func seasonsDelegate(model: [Season]) -> ArrayDelegate<Season> {
        
        return ArrayDelegate(model: model, selectRow: { (season: Season, tableView: UITableView, controller: UITableViewController?) -> Void in
            
            // La mostramos
            let episodesDataSource = DataSources.episodesDataSource(model: season.sortedEpisodes())
            let episodesViewController = ArrayTableViewController(dataSource: episodesDataSource,
                                                                 delegate: nil,
                                                                 title: "Episodes",
                                                                 style: .plain)
            
            controller?.navigationController?.pushViewController(episodesViewController, animated: true)
        })
    }
}
