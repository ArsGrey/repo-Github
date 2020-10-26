//
//  AddNoteListModels.swift
//  AwesomeNotes
//
//  Created by Simba on 21/10/2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation


struct AddNoteListModels {
    struct Model {
        var note: NoteModel
    }
    
    struct Fetch {
        struct Request {
            
        }
        
        struct Response {
            let note: NoteModel
        }
        
        struct ViewModel {
            var addList: [List.Section]
        }
    }
    
    struct List {
        struct Section: TableDataSection, UniqueIdentifyable {
            enum Identifier: Hashable {
                case note
                case add
            }
            
            let id: Identifier
            var cells: [ViewModel]
            let title: String
        }
        enum ViewModel: Hashable, UniqueIdentifyable {
            enum Identifier: Hashable {
                case note
                case add
            }
            case note(AddNoteListViewModel)
            case add(AddNoteListViewModel)
            
            var id: Identifier {
                switch self {
                case .note(let viewModel):
                    return viewModel.id
                    
                case .add(let viewModel):
                    return viewModel.id
                }
            }
        }
        
        struct AddNoteListViewModel: UniqueIdentifyable {
            let id: ViewModel.Identifier
            let title: String
            
        }
        
    }
}
