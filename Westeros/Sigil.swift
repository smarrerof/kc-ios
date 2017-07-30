//
//  Sigil.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/30/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit


final class Sigil {
    
    let description: String
    let image: UIImage
    
    init(image: UIImage, description : String) {
        (self.image, self.description) = (image, description)
    }
    
}
