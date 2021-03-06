//
//  LoginWireframe.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILoginWireframe: class {
	
}

class LoginWireframe: ILoginWireframe {
	
	weak var view: LoginViewController?
	
	init(view: LoginViewController) {
		self.view = view
	}
}
