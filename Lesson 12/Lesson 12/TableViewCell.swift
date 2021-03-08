//
//  TableViewCell.swift
//  Lesson 12
//
//  Created by Феликс Фимберг on 15.01.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var tempLabel2: UILabel!
    @IBOutlet weak var windLabel2: UILabel!
    @IBOutlet weak var cloudsLabel2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(object: Weather, data: String) {
        self.dataLabel.text = data
        self.tempLabel.text = String(object.temp)
        self.cloudsLabel.text = String(object.clouds)
        self.windLabel.text = String(object.windSpeed)
    }
    
    func set2(object: Weather, data: String) {
        self.dateLabel2.text = data
        self.tempLabel2.text = String(object.temp)
        self.cloudsLabel2.text = String(object.clouds)
        self.windLabel2.text = String(object.windSpeed)
    }
}

