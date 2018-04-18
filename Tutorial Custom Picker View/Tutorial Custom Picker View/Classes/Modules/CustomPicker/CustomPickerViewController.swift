//
//  CustomPickerViewController.swift
//  Tutorial Custom Picker View
//
//  Created by Ari Munandar on 17/04/18.
//  Copyright © 2018 Artdev Indonesia. All rights reserved.
//

import UIKit

protocol CustomPickerDelegate {
	func didSelect(data: String)
}

class CustomPickerViewController: UIViewController {

	@IBOutlet weak var bottomContentView: NSLayoutConstraint!
	@IBOutlet weak var tableView: UITableView!
	
	var delegate: CustomPickerDelegate?
	var selectedData: String = ""
	var data: [String] = []
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.bottomContentView.constant = -UIScreen.main.bounds.width
		self.view.layoutIfNeeded()
		
		DispatchQueue.main.async {
			UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
				self.bottomContentView.constant = 0.0
				self.view.layoutIfNeeded()
			}, completion: nil)
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 50.0
		self.tableView.separatorInset = UIEdgeInsetsMake(0, UIScreen.main.bounds.width, 0, 0)
		self.tableView.register(UINib(nibName: "CustomPickerTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

	@IBAction func handleSelect(_ sender: UIButton) {
		DispatchQueue.main.async {
			UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
				self.bottomContentView.constant = -UIScreen.main.bounds.width
				self.view.layoutIfNeeded()
				self.dismiss(animated: true) {
					self.delegate?.didSelect(data: self.selectedData)
				}
			}, completion: nil)
		}
	}
}

extension CustomPickerViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomPickerTableViewCell
		cell.dataLabel.text = self.data[indexPath.row]
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedData = self.data[indexPath.row]
		if let cell = tableView.cellForRow(at: indexPath) as? CustomPickerTableViewCell {
			cell.accessoryType = .checkmark
		}
	}
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		if let cell = tableView.cellForRow(at: indexPath) as? CustomPickerTableViewCell {
			cell.accessoryType = .none
		}
	}
}
