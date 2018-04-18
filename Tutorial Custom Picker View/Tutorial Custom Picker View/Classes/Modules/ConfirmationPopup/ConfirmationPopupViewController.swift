//
//  ConfirmationPopupViewController.swift
//  Tutorial Custom Picker View
//
//  Created by Ari Munandar on 17/04/18.
//  Copyright © 2018 Artdev Indonesia. All rights reserved.
//

import UIKit

protocol ConfirmationPopupDelegate {
	func hide()
}

class ConfirmationPopupViewController: UIViewController {

	var delegate: ConfirmationPopupDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func handleHideDialog(_ sender: UIButton) {
		self.dismiss(animated: true) {
			self.delegate?.hide()
		}
	}
}
