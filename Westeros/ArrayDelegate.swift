//
//  ArrayDelegate.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/22/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit


final class ArrayDelegate<Element>: NSObject, UITableViewDelegate {
    
    typealias Elements = [Element]
    typealias SelectRow = (Element, UITableView, UITableViewController?) -> Bool
    
    
    private let _model: Elements
    private let _selectRow: SelectRow
    
    
    public var controller: UITableViewController?
    
    
    init(model: Elements, selectRow: @escaping SelectRow) {
        
        _model = model
        _selectRow = selectRow
        
        super.init()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let element = _model[indexPath.row]
        
        _selectRow(element, tableView, controller)
    }
}
