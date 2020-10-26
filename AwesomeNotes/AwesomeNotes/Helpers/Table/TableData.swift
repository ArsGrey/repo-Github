//
//  TableData.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 20.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

protocol TableData: class {
	
	associatedtype ViewModel
	
	var count: Int { get }
	
	subscript(indexPath: IndexPath) -> ViewModel { get set }
}
