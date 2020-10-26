//
//  NoteListInteractor.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 20.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

protocol NoteListBusinessLogic: class {
	func fetchNotes()
}

final class NoteListInteractor: NoteListBusinessLogic {
	
	private let presenter: NoteListPresentationLogic
	
	var model: NoteListModels.Model = .init(noteList: [])
	
	init(presenter: NoteListPresentationLogic) {
		self.presenter = presenter
	}
	
	func fetchNotes() {
		// Just example, you will replace it your own code later
		model.noteList.append(.init(title: "Now, it's work", description: "empty"))
		presenter.presentNotes(response: .init(noteList: model.noteList))
	}
}
