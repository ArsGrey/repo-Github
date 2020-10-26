//
//  AddNoteListPresenter.swift
//  AwesomeNotes
//
//  Created by Simba on 24/10/2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation


protocol AddListPresentLogic: class {
    func presentNotes(response: AddNoteListModels.Fetch.Response)
}

protocol AddListDisplayLogic: class {
    func displayLogic(viewModel: AddNoteListModels.Fetch.ViewModel)
}

final class AddNoteListPresenter: AddListPresentLogic {
    private weak var viewController: AddListDisplayLogic?
     
    init(viewController: AddListDisplayLogic) {
        self.viewController = viewController
    }
   
    func presentNotes(response: AddNoteListModels.Fetch.Response) {
        viewController?.displayLogic(viewModel: AddNoteListModels.Fetch.ViewModel(addList: [noteSection(response)]))
        viewController?.displayLogic(viewModel: AddNoteListModels.Fetch.ViewModel(addList: [addSection(response)]))
    }
    
    
    private func noteSection(_ response: AddNoteListModels.Fetch.Response) -> AddNoteListModels.List.Section {
        return .init(id: .note, cells: [noteListViewModel(response.note)], title: "")
    }
    
    private func addSection(_ response: AddNoteListModels.Fetch.Response) -> AddNoteListModels.List.Section {
        return .init(id: .add, cells: [addListViewModel(response.note)], title: "")
    }
    
    private func noteListViewModel(_ noteModel: NoteModel) -> AddNoteListModels.List.ViewModel {
        let noteListViewModel = AddNoteListModels.List.AddNoteListViewModel(id: .note, title: noteModel.title)
        let viewModel = AddNoteListModels.List.ViewModel.note(noteListViewModel)
        return viewModel
    }
    
    private func addListViewModel(_ noteModel: NoteModel) -> AddNoteListModels.List.ViewModel {
        let addListViewModel = AddNoteListModels.List.AddNoteListViewModel(id: .add, title: noteModel.title)
        let viewModel = AddNoteListModels.List.ViewModel.add(addListViewModel)
        return viewModel
    }
    
        
}
