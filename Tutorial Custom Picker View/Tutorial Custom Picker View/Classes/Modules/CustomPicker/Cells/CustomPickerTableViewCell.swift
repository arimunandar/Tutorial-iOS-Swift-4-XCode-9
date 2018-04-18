//
//  CustomPickerTableViewCell.swift
//  Tutorial Custom Picker View
//
//  Created by Ari Munandar on 17/04/18.
//  Copyright © 2018 Artdev Indonesia. All rights reserved.
//

import UIKit

class CustomPickerTableViewCell: UITableViewCell {

	@IBOutlet weak var dataLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsetsMake(0, 16, 0, 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
