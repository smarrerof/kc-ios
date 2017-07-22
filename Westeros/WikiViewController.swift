//
//  WikiViewController.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 7/17/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    private let model: House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncViewWithModel()
    }
    
    
    func syncViewWithModel() {
        activityView.isHidden = false
        activityView.startAnimating()
        
        title = model.name
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: model.wikiURL))
    }
}

extension WikiViewController : UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == .linkClicked) || (navigationType == .formSubmitted) {
            return false
        } else {
            return true
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityView.stopAnimating()
        activityView.isHidden = true
    }
}
