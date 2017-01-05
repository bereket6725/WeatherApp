//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Bereket Ghebremedhin on 1/3/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var backgroundPusheenImage: UIImageView!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var nightLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var catFactTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.catFactTextView.isEditable = false
        self.catFactTextView.isScrollEnabled = false 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
