//
//  NoteListTableData.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 20.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

final class NoteListTableData: SectionedTableData {
	typealias Section = NoteListModels.List.Section
	typealias ViewModel = NoteListModels.List.ViewModel
	
	var list: [NoteListModels.List.Section] = []
}
