//
//  LoginAssembly.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

class LoginAssembly: Assembly {
	
	func assemble(container: Container) {
		container.register(LoginViewController.self) { (r, parameters: [String: Any]) in
			let view = LoginViewController()
			let presenter = r.resolve(ILoginPresenter.self, argument: view as ILoginViewController)!
			presenter.parameters = parameters
			view.presenter = presenter
			return view
		}
		
		container.register(ILoginPresenter.self) { (r, view: ILoginViewController) in
			let interactor = r.resolve(ILoginInteractor.self)!
			let wireframe = r.resolve(ILoginWireframe.self, argument: view as! LoginViewController)!
			let presenter = LoginPresenter(interactor: interactor, wireframe: wireframe, view: view)
			interactor.delegate = presenter
			return presenter
		}
		
		container.register(ILoginInteractor.self) { r in
			let manager = r.resolve(ILoginDataManager.self)!
			return LoginInteractor(manager: manager)
		}
		
		container.register(ILoginWireframe.self) { (r, view: LoginViewController) in
			return LoginWireframe(view: view)
		}
		
		container.register(ILoginDataManager.self) { r in
			return LoginDataManager()
		}
	}
}