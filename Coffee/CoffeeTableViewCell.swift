//
//  CoffeeTableViewCell.swift
//  Coffee
//
//  Created by Anastasia Loginova on 16.03.17.
//  Copyright © 2017 Anastasia Loginova. All rights reserved.
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coffeNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
