//
//  TableAdapter.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 05.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation
import UIKit

protocol TableAdapter: class {
	
	associatedtype Table: UITableView
	
	var table: Table! { get set }
	
	func registerCells()
	func set(table: Table)
}

extension TableAdapter where Table == UITableView, Self: UITableViewDelegate, Self: UITableViewDataSource {
	
	func set(table: Table) {
		self.table = table
		self.registerCells()
		
		self.table.delegate = self
		self.table.dataSource = self
	}
}

//extension TableAdapter where Table == UICollectionView, Self: UICollectionViewDataSource, Self: UICollectionViewDelegateFlowLayout {
//
//	func set(table: Table) {
//		self.table = table
//		self.registerCells()
//
//		self.table.delegate = self
//		self.table.dataSource = self
//	}
//
//}
