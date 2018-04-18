//
//  HomeViewController.swift
//  Tutorial Calendar Picker
//
//  Created by Ari Munandar on 18/04/18.
//  Copyright © 2018 Artdev Indonesia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, CalendarPickerDelegate {

	@IBOutlet weak var selectDate: UITextField!
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func handleSelectDate(_ sender: UITextField) {
		self.view.endEditing(true)
		let vc = CalendarPickerViewController()
		vc.modalPresentationStyle = .overCurrentContext
		vc.modalTransitionStyle = .crossDissolve
		vc.delegate = self
		self.present(vc, animated: true, completion: nil)
	}
	
	func getDateString(date: String) {
		self.selectDate.text = date
	}
}
