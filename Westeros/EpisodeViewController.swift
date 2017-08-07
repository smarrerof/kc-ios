//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 8/4/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    let model: Episode
    
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewWithModel()
    }
    
    func syncViewWithModel() {
        
        // model -> view
    }
}
