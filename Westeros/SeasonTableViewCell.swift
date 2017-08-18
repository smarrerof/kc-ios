//
//  SeasonTableViewCell.swift
//  Westeros
//
//  Created by Sergio Marrero Fernandez on 8/15/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class SeasonTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
