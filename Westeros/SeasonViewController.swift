//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 8/3/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var generalInfoLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    let model: Season
    
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncViewWithModel()
    }
    
    
    func setupUI() {
        
        // Creamos los botones del navigationController
        let episodes = UIBarButtonItem(title: "Episodes",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayEpisodes))
        
        // Añadimos
        navigationItem.rightBarButtonItem = episodes
    }
    
    func syncViewWithModel() {
        
        // model -> view
        posterImageView.image = model.poster
        generalInfoLabel.text = "\(model.releaseDate.toString()). \(model.count) episodes"
        overviewLabel.text = model.overview
        overviewLabel.sizeToFit()
    }
    
    
    @objc func displayEpisodes() {
        let episodesDataSource = DataSources.episodesDataSource(model: model.sortedEpisodes())
        let episodesDelegate = Delegates.episodesDelegate(model: model.sortedEpisodes())
        let episodesViewController = ArrayTableViewController(dataSource: episodesDataSource,
                                                              delegate: episodesDelegate,
                                                              title: "Episodes",
                                                              style: .plain)
        
        self.navigationController?.pushViewController(episodesViewController, animated: true)
    }
}
