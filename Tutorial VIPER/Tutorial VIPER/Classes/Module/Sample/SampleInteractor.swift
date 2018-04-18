//
//  SampleInteractor.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol SampleInteractorDelegate: class {
	func presentSuccessData(data: String)
	func presentFailureData(error: String)
}

protocol ISampleInteractor: class {
	var delegate: SampleInteractorDelegate? { get set }
	func prepareProcess(data: String)
}

class SampleInteractor: ISampleInteractor {
	
	var manager: ISampleDataManager?
	var delegate: SampleInteractorDelegate?
	
	init(manager: ISampleDataManager) {
		self.manager = manager
	}

	func prepareProcess(data: String) {
		self.manager?.processData(data: data, onSuccess: { (success) in
			self.delegate?.presentSuccessData(data: success)
		}, onFailure: { (error) in
			self.delegate?.presentFailureData(error: error)
		})
	}
}
