//
//  NoteListViewController.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 05.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation
import UIKit

class NoteListViewController: UIViewController, NoteListDisplayLogic, NoteListTableAdapterDelegate {
    
//    func printSomething(text: String) {
//        let action = UIAlertAction(title: "Ok", style: .default, handler: {_ in})
//        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
//        alert.addAction(action)
//        self.present(alert, animated: true, completion: nil)
//    }
    
	
	@IBOutlet weak var tableView: UITableView!
	
	var tableData: NoteListTableData!
	// Hmm what's happing here?🤔
	private lazy var interactor: NoteListBusinessLogic = NoteListInteractor(presenter: NoteListPresenter(viewController: self))
	var tableAdapter: NoteListTableAdapter!
	var router: NoteListRoutingLogic!
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		self.tableData = .init()
		self.tableAdapter = .init(tableData: self.tableData)
		self.router = NoteListRouter()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		tableAdapter.set(table: tableView)
		self.title = "Test"
		interactor.fetchNotes()
//        tableAdapter.delegate = self
	}
	
	func displayLogic(viewModel: NoteListModels.Fetch.ViewModel) {
		tableData.set(list: viewModel.list)
		tableView.reloadData()
	}
}
