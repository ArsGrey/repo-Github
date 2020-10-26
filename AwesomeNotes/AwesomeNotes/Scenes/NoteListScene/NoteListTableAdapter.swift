//
//  NoteListTableAdapter.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 05.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation
import UIKit

// You can combine some protocols in one type like "NoteListTableAdapterDelegate & SomeProtocol..."
typealias NoteListCellDelegate = NoteListTableAdapterDelegate

protocol NoteListTableAdapterDelegate: class {
//    func printSomething(text: String)
}
// How work tableAdapter and tableData?🤔
final class NoteListTableAdapter: NSObject, TableAdapter, UITableViewDataSource, UITableViewDelegate {

	var table: UITableView!
	var tableData: NoteListTableData
	weak var delegate: NoteListTableAdapterDelegate?
	
	init(tableData: NoteListTableData) {
		self.tableData = tableData
	}
	
	func registerCells() {
		table.register(NoteListCell.self)
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return tableData.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch tableData[indexPath] {
		case .note(let viewModel):
			return tableView.dequeueCell(for: indexPath, viewModel: viewModel) as NoteListCell
		}
	}
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch tableData[indexPath] {
//        case .note(let viewModel):
//            delegate?.printSomething(text: viewModel.title)
//        }
//    }
	
}
