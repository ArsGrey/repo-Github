//
//  AddNoteListInteractor.swift
//  AwesomeNotes
//
//  Created by Simba on 23/10/2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

protocol NoteListBusibesLogic: class {
    func fetchNotes()
}

final class AddNoteListInteractor: NoteListBusibesLogic {
    
    private let presenter: AddListPresentLogic
    init(presenter: AddListPresentLogic) {
        self.presenter = presenter
    }
    
    var model = AddNoteListModels.Model(note: NoteModel(title: "", description: ""))
    
    func fetchNotes() {
    
    }
}


