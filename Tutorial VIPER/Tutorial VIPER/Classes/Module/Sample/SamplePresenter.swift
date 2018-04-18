//
//  SamplePresenter.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISamplePresenter: class {
	var parameters: [String: Any]? { get set }
	func getName()
}

class SamplePresenter: ISamplePresenter {
	
	var interactor: ISampleInteractor?
	var wireframe: ISampleWireframe?
	weak var view: ISampleViewController?
	var parameters: [String: Any]?
	
	init(interactor: ISampleInteractor, wireframe: ISampleWireframe, view: ISampleViewController) {
		self.interactor = interactor
		self.wireframe = wireframe
		self.view = view
	}
	
	func getName() {
		if let name = self.parameters?["name"] as? String {
			self.interactor?.prepareProcess(data: name)
		}
	}
}

extension SamplePresenter: SampleInteractorDelegate {
	
	func presentSuccessData(data: String) {
		self.view?.showSuccessData(data: data)
	}
	
	func presentFailureData(error: String) {
		print(error)
	}
}
