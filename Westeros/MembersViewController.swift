//
//  MembersViewController.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/22/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class MembersViewController: UITableViewController {
        
    let model: [Person]
    
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "MemberCell"
        
        // Descubrir cual es la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // Creamos la celda
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar Person -> Cell
        cell?.textLabel?.text = person.name
        
        return cell!
    }
}
