//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/22/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource: ArrayDataSource<Element>
    let delegate: ArrayDelegate<Element>
    
    init(dataSource: ArrayDataSource<Element>, delegate: ArrayDelegate<Element>, title: String, style: UITableViewStyle) {
     
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style: style)
        
        self.title = title
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        self.delegate.controller = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
