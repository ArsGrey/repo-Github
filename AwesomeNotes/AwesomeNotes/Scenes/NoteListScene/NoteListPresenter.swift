//
//  NoteListPresenter.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 20.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

protocol NoteListPresentationLogic: class {
	func presentNotes(response: NoteListModels.Fetch.Response)
}

protocol NoteListDisplayLogic: class {
	func displayLogic(viewModel: NoteListModels.Fetch.ViewModel)
}

final class NoteListPresenter: NoteListPresentationLogic {
	
	private weak var viewController: NoteListDisplayLogic?
	
	init(viewController: NoteListDisplayLogic) {
		self.viewController = viewController
	}
	
	func presentNotes(response: NoteListModels.Fetch.Response) {
		viewController?.displayLogic(viewModel: .init(list: [baseSection(response)]))
	}
	
	private func baseSection(_ response: NoteListModels.Fetch.Response) -> NoteListModels.List.Section {
		let cells = response.noteList.map({ noteListViewModel($0) })
		return .init(id: .base, cells: cells)
	}
	
	private func noteListViewModel(_ noteModel: NoteModel) -> NoteListModels.List.ViewModel {
        let noteListViewModel = NoteListModels.List.NoteListViewModel(id: .note, title: noteModel.title)
        let viewModel = NoteListModels.List.ViewModel.note(noteListViewModel)
		return viewModel
	}
}
