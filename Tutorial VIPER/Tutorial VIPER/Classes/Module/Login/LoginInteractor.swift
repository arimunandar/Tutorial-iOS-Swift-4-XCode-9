//
//  LoginInteractor.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol LoginInteractorDelegate: class {
	
}

protocol ILoginInteractor: class {
	var delegate: LoginInteractorDelegate? { get set }
}

class LoginInteractor: ILoginInteractor {
	
	var manager: ILoginDataManager?
	var delegate: LoginInteractorDelegate?
	
	init(manager: ILoginDataManager) {
		self.manager = manager
	}
}