//
//  SampleAssembly.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

class SampleAssembly: Assembly {
	
	func assemble(container: Container) {
		container.register(SampleViewController.self) { (r, parameters: [String: Any]) in
			let view = SampleViewController()
			let presenter = r.resolve(ISamplePresenter.self, argument: view as ISampleViewController)!
			presenter.parameters = parameters
			view.presenter = presenter
			return view
		}
		
		container.register(ISamplePresenter.self) { (r, view: ISampleViewController) in
			let interactor = r.resolve(ISampleInteractor.self)!
			let wireframe = r.resolve(ISampleWireframe.self, argument: view as! SampleViewController)!
			let presenter = SamplePresenter(interactor: interactor, wireframe: wireframe, view: view)
			interactor.delegate = presenter
			return presenter
		}
		
		container.register(ISampleInteractor.self) { r in
			let manager = r.resolve(ISampleDataManager.self)!
			return SampleInteractor(manager: manager)
		}
		
		container.register(ISampleWireframe.self) { (r, view: SampleViewController) in
			return SampleWireframe(view: view)
		}
		
		container.register(ISampleDataManager.self) { r in
			return SampleDataManager()
		}
	}
}