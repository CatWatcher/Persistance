//
//  EmojiTableViewCell.swift
//  Emoji
//
//  Created by Феликс Фимберг on 02.09.2020.
//  Copyright © 2020 Феликс Фимберг. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // настройка ячейки
    func set(object: EmojiStruct) {
        self.descriptionLabel.text = object.description
        self.iconLabel.text = object.emoji
        self.nameLabel.text = object.name
    }
}
