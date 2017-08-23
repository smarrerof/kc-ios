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
    let delegate: ArrayDelegate<Element>?
    
    init(dataSource: ArrayDataSource<Element>, delegate: ArrayDelegate<Element>?, title: String, style: UITableViewStyle) {
     
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style: style)
        
        self.title = title
        
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        //tableView.separatorInset.left = 0
        //tableView.separatorInset.right = 0
        
        self.delegate?.controller = self
    }
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "SeasonTableViewCell", bundle: nil), forCellReuseIdentifier: "SeasonCell")
        tableView.register(UINib(nibName: "EpisodeTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodeCell")
        tableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
