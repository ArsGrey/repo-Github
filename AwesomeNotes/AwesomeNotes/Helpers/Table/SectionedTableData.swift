//
//  SectionedTableData.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 20.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

protocol TableDataSection {
	associatedtype ViewModel
	
	var cells: [ViewModel] { get set }
	
}

extension TableDataSection {
	
	var count: Int {
		return cells.count
	}
	
}

protocol SectionedTableData: TableData {
	associatedtype Section: TableDataSection
	
	var list: [Section] { get set }
}

extension SectionedTableData where Section.ViewModel == ViewModel {
	
	var flattenedViewModelList: [Section.ViewModel] {
		return self.list.flatMap { $0.cells }
	}
	
	var count: Int {
		return list.count
	}
	
	func set(list: [Section]) {
		self.list = list
	}
	
	subscript(index: Int) -> Section {
		get { return list[index] }
		set { list[index] = newValue }
	}
	
	subscript(indexPath: IndexPath) -> ViewModel {
		get {
			return list[indexPath.section].cells[indexPath.row]
		}
		set {
			list[indexPath.section].cells[indexPath.row] = newValue
		}
	}
	
}

extension SectionedTableData where Section.ViewModel == ViewModel, ViewModel: Equatable {
	
	func indexPath(of viewModel: ViewModel) -> IndexPath? {
		for (sectionIndex, section) in self.list.enumerated() {
			for (cellIndex, cell) in section.cells.enumerated() where cell == viewModel {
				return IndexPath(row: cellIndex, section: sectionIndex)
			}
		}
		return nil
	}
}

extension SectionedTableData where Section.ViewModel == ViewModel, ViewModel: UniqueIdentifyable {
	
	func indexPath(by uniqeIdentifier: ViewModel.Identifier) -> IndexPath? {
		for (sectionIndex, section) in self.list.enumerated() {
			for (cellIndex, cell) in section.cells.enumerated() where cell.id == uniqeIdentifier {
				return IndexPath(row: cellIndex, section: sectionIndex)
			}
		}
		return nil
	}
	
	func viewModel(by uniqueIdentifier: ViewModel.Identifier) -> ViewModel? {
		for section in self.list {
			for cell in section.cells where cell.id == uniqueIdentifier {
				return cell
			}
		}
		return nil
	}
}
