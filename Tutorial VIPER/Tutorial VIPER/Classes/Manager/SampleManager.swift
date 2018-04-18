//
//  SampleManager.swift
//  Tutorial VIPER
//
//  Created by Ari Munandar on 11/04/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol ISampleDataManager: class {
	func processData(data: String, onSuccess: (_ data: String)->(), onFailure: ((_ error: String)->())?)
}

class SampleDataManager: ISampleDataManager {
	
	func processData(data: String, onSuccess: (String) -> (), onFailure: ((String) -> ())?) {
		if data == "Ari Munandar" {
			onSuccess("Success Bro!")
		} else {
			onFailure?("Error Bro!")
		}
	}
}
