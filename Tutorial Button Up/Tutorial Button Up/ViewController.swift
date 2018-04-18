//
//  ViewController.swift
//  Tutorial Button Up
//
//  Created by Ari Munandar on 17/04/18.
//  Copyright © 2018 Artdev Indonesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var bottomButonSubmit: NSLayoutConstraint!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(notification:)), name: .UIKeyboardWillHide, object: nil)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow , object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide , object: nil)
	}
	
	@objc
	func keyboardWillAppear(notification: NSNotification?) {
		
		guard let keyboardFrame = notification?.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
			return
		}
		
		let keyboardHeight: CGFloat
		if #available(iOS 11.0, *) {
			keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
		} else {
			keyboardHeight = keyboardFrame.cgRectValue.height
		}
		
		UIView.animate(withDuration: 0.55, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
			self.bottomButonSubmit.constant = keyboardHeight
			self.view.layoutIfNeeded()
		}, completion: nil)
	}
	
	@objc
	func keyboardWillDisappear(notification: NSNotification?) {
		UIView.animate(withDuration: 0.55, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
			self.bottomButonSubmit.constant = 0.0
			self.view.layoutIfNeeded()
		}, completion: nil)
	}

	@IBAction func handleSubmit(_ sender: UIButton) {
		self.view.endEditing(true)
	}
	
}

