//
//  AddNoteListTableAdapter.swift
//  AwesomeNotes
//
//  Created by Simba on 22/10/2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation
import UIKit


final class AddNoteListTableAdapter: NSObject, TableAdapter, UITableViewDelegate, UITableViewDataSource {
    
    var table: UITableView!
    var tableData: AddNoteListTableData
    
    init(tableData: AddNoteListTableData) {
        self.tableData = tableData
    }
    
    func registerCells() {
        table.register(AddNoteCell.self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableData[indexPath] {
        case .note(let viewModel):
            return tableView.dequeueCell(for: indexPath, viewModel: viewModel) as AddNoteCell
        case .add(let viewModel):
            return tableView.dequeueCell(for: indexPath, viewModel: viewModel) as AddNoteCell
        }
    }
    
}
