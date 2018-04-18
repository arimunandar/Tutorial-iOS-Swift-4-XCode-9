//
//  LoginPresenter.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILoginPresenter: class {
	var parameters: [String: Any]? { get set }
}

class LoginPresenter: ILoginPresenter {
	
	var interactor: ILoginInteractor?
	var wireframe: ILoginWireframe?
	weak var view: ILoginViewController?
	var parameters: [String: Any]?
	
	init(interactor: ILoginInteractor, wireframe: ILoginWireframe, view: ILoginViewController) {
		self.interactor = interactor
		self.wireframe = wireframe
		self.view = view
	}
}

extension LoginPresenter: LoginInteractorDelegate {
	
}
