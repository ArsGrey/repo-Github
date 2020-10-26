//
//  AddNoteViewController.swift
//  AwesomeNotes
//
//  Created by Simba on 22/10/2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableData: AddNoteListTableData!
    var tableAdapter: AddNoteListTableAdapter!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tableData = .init()
        self.tableAdapter = .init(tableData: self.tableData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        self.title = "NewNote"
        tableAdapter.set(table: tableView)
    }
    


}
