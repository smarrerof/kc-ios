//
//  ArrayDelegateTests.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/22/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import XCTest
@testable import Westeros

class ArrayDelegateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testArrayDelegateCreation() {
        
        let delegate = ArrayDelegate(model: [1, 2, 3, 4], selectRow: { (number: Int, tableView: UITableView, controller: UITableViewController?) -> Void in
            
            let viewController = UIViewController()
            controller?.navigationController?.pushViewController(viewController, animated: true)
        })
        
        XCTAssertNotNil(delegate)
    }
}
