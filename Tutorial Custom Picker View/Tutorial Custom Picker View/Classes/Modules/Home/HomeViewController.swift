//
//  HomeViewController.swift
//  Tutorial Custom Picker View
//
//  Created by Ari Munandar on 17/04/18.
//  Copyright © 2018 Artdev Indonesia. All rights reserved.
//

import UIKit

class PopupSetup {
	class func show(view: UIViewController, delegate: ConfirmationPopupDelegate) {
		let vc = ConfirmationPopupViewController()
		vc.modalPresentationStyle = .overCurrentContext
		vc.modalTransitionStyle = .crossDissolve
		vc.delegate = delegate
		view.present(vc, animated: true, completion: nil)
	}
}

class HomeViewController: UIViewController, ConfirmationPopupDelegate {
	@IBOutlet var selectField: UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	@IBAction func handleSelect(_ sender: UITextField) {
		sender.resignFirstResponder()
	}
	
	@IBAction func handleShowPopup(_ sender: UIButton) {
		PopupSetup.show(view: self, delegate: self)
	}
	
	func hide() {
		print("Hide")
	}
}

extension HomeViewController: CustomPickerDelegate {
	func didSelect(data: String) {
		self.selectField.text = data
	}
}
