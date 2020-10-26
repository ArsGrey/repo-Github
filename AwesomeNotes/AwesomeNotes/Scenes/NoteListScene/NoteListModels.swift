//
//  NoteListModels.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 20.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

struct NoteListModels {
	struct Model {
		var noteList: [NoteModel]
	}
	
	struct Fetch {
		struct Request {
			
		}
		
		struct Response {
			let noteList: [NoteModel]
		}
		
		struct ViewModel {
			var list: [List.Section]
		}
	}
	
	struct List {
		struct Section: TableDataSection, UniqueIdentifyable {
			
			enum Identifier: Hashable {
				case base
			}
			
			let id: Identifier
			var cells: [ViewModel]
		}
		
		enum ViewModel: Hashable, UniqueIdentifyable {
			enum Identifier: Hashable {
				case note
			}
			
			case note(NoteListViewModel)
			
			var id: Identifier {
				switch self {
                case .note(let viewModel):
					return viewModel.id
				}
			}
		}
		
		struct NoteListViewModel: UniqueIdentifyable {
			let id: ViewModel.Identifier
			let title: String
		}
	}
}
