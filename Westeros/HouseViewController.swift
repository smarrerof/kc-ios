//
//  HouseViewController.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/10/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var wordsTextView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    
    let model : House
    
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
        
    }
    
    // Chapuza de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncViewWithModel()
    }
    
    
    func setupUI() {
        
        // Creamos los botones del avigationController
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        let members = UIBarButtonItem(title: "Members",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayMembers))
        
        // Añadimos
        navigationItem.rightBarButtonItems = [members, wiki]
    }
    
    func syncViewWithModel(){
        
        // model -> view
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsTextView.text = model.words
    }
    
    @objc func displayWiki() {
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(model: model)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC,
                                                 animated: true)
    }
    
    @objc func displayMembers() {
        
        // Creamos un MembersVC
        let membersVC = MembersViewController(model: model.sortedMembers())
        
        // Lo caramos en el navigation
        navigationController?.pushViewController(membersVC,
                                                 animated: true)
    }
}
















