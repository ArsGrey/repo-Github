//
//  NoteListCell.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 07.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation
import UIKit

final class NoteListCell: UITableViewCell, NibReusableCell, ViewModelCell {
	@IBOutlet weak var titleLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	func set(viewModel: NoteListModels.List.NoteListViewModel) {
		self.titleLabel.text = viewModel.title
	}
}
