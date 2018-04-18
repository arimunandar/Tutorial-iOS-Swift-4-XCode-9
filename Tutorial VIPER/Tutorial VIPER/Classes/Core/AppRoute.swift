//
//  AppRoute.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 Artdev Indonesia. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

class AppRoute {

	fileprivate class func setup() -> Assembler {
		let assemble = Assembler()
		 assemble.apply(assemblies: [SampleAssembly()])
		return assemble
	}
	
	class func present() -> Resolver {
		return AppRoute.setup().resolver
	}
}
