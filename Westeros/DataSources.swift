//
//  DataSources.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/22/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class DataSources {
    
    static func housesDataSource(model: [House]) -> ArrayDataSource<House> {
        
        return ArrayDataSource(model: model, cellMaker: {(house: House, tableView: UITableView) -> UITableViewCell in
                                
            let cellID = "HouseCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            return cell!
        })
    }
    
    static func membersDataSource(model: [Person]) -> ArrayDataSource<Person> {
        
        return ArrayDataSource(model: model, cellMaker: {(person: Person, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "PersonCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! PersonTableViewCell

            cell.photoImageView.image = person.photo
            cell.fullNameLabel.text = person.fullName
            
            return cell
        })
    }
    
    static func seasonsDataSource(model: [Season]) -> ArrayDataSource<Season> {
        
        return ArrayDataSource(model: model, cellMaker: {(season: Season, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "SeasonCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! SeasonTableViewCell
            
            cell.posterImage.image = season.poster
            cell.nameLabel.text = season.name
            cell.shortDescriptionLabel.text = season.shortDescription
            
            return cell
        })
    }
    
    static func episodesDataSource(model: [Episode]) -> ArrayDataSource<Episode> {
        
        return ArrayDataSource(model: model, cellMaker: {(episode: Episode, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "EpisodeCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! EpisodeTableViewCell
            
            cell.posterImageView.image = episode.poster
            cell.nameLabel.text = episode.name
            cell.airDateLabel.text = episode.airDate.toString()
            
            return cell
        })
    }
}
