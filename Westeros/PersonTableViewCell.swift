//
//  PersonTableViewCell.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 8/23/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.layer.cornerRadius = photoImageView.bounds.height / 2
        photoImageView.clipsToBounds = true
    }
}
