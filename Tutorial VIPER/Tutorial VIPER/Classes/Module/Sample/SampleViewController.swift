//
//  SampleViewController.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISampleViewController: class {
	func showSuccessData(data: String)
}

class SampleViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	
	var presenter: ISamplePresenter?

	override func viewDidLoad() {
        super.viewDidLoad()

		DispatchQueue.main.async {
			self.presenter?.getName()
		}
    }
}

extension SampleViewController: ISampleViewController {
	
	func showSuccessData(data: String) {
		self.titleLabel.text = data
	}
}

extension SampleViewController {
	
}

extension SampleViewController {
	
}
