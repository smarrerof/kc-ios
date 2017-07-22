//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/11/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: self)

        return nav
    }
}
