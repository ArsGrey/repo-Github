//
//  AddNoteListTableData.swift
//  AwesomeNotes
//
//  Created by Simba on 22/10/2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

final class AddNoteListTableData: SectionedTableData {
    typealias Section = AddNoteListModels.List.Section
    typealias ViewModel = AddNoteListModels.List.ViewModel
    
    var list: [AddNoteListModels.List.Section] = []
}
