//
//  AddNoteCell.swift
//  AwesomeNotes
//
//  Created by Simba on 21/10/2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation
import UIKit

final class AddNoteCell: UITableViewCell, NibReusableCell, ViewModelCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: AddNoteListModels.List.AddNoteListViewModel) {
        self.titleLabel.text = viewModel.title
    }
}
