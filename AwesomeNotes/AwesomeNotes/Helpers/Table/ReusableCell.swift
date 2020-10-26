//
//  ReusableCell.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 05.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import UIKit

protocol ReusableCell: class {
	static var reuseId: String { get }
}

extension ReusableCell {
	static var reuseId: String {
		return "\(Self.self)"
	}
}

protocol NibReusableCell: ReusableCell {
	static var nib: UINib { get }
}

extension NibReusableCell {
	static var nib: UINib {
		return UINib(nibName: reuseId, bundle: nil)
	}
}

protocol ViewModelCell: class {
	associatedtype ViewModel
	
	func set(viewModel: ViewModel)
}

protocol DelegatableCell: class {
	associatedtype Delegate
	
	var delegate: Delegate? { get set }
}


extension UITableView {
	
	func dequeueHeaderFooter<T: ReusableCell>() -> T {
		return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseId) as! T
	}
	
	func dequeueReusableCell<T: ReusableCell & UITableViewCell>() -> T? {
		return self.dequeueReusableCell(withIdentifier: T.reuseId) as? T
	}
	
	func dequeueCell<T: ReusableCell & UITableViewCell>(for indexPath: IndexPath) -> T {
		return self.dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
	}
	
	func dequeueCell<T: ReusableCell & UITableViewCell & DelegatableCell>(for indexPath: IndexPath, delegate: T.Delegate?) -> T {
		let cell = self.dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
		cell.delegate = delegate
		return cell
	}
	
	func dequeueCell<T: ReusableCell & UITableViewCell & ViewModelCell>(for indexPath: IndexPath, viewModel: T.ViewModel) -> T {
		let cell = self.dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
		cell.set(viewModel: viewModel)
		return cell
	}
	
	func dequeueCell<T: ReusableCell & UITableViewCell & ViewModelCell & DelegatableCell>(for indexPath: IndexPath, viewModel: T.ViewModel, delegate: T.Delegate?) -> T {
		let cell = self.dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
		cell.set(viewModel: viewModel)
		cell.delegate = delegate
		return cell
	}
	
	func register<T: ReusableCell & UITableViewHeaderFooterView>(_ cell: T.Type) {
		self.register(cell, forHeaderFooterViewReuseIdentifier: cell.reuseId)
	}
	
	func register(_ cell: NibReusableCell.Type) {
		self.register(cell.nib, forCellReuseIdentifier: cell.reuseId)
	}
	
	func register<T: ReusableCell & UITableViewCell>(_ cell: T.Type) {
		self.register(cell, forCellReuseIdentifier: cell.reuseId)
	}
	
}

extension UICollectionView {
	
	func dequeueCell<T: ReusableCell & UICollectionViewCell>(for indexPath: IndexPath) -> T {
		return self.dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as! T
	}
	
	func dequeueCell<T: ReusableCell & UICollectionViewCell & DelegatableCell>(for indexPath: IndexPath, delegate: T.Delegate) -> T {
		let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as! T
		cell.delegate = delegate
		return cell
	}
	
	func register(_ cell: NibReusableCell.Type) {
		self.register(cell.nib, forCellWithReuseIdentifier: cell.reuseId)
	}
	
	func register<T: ReusableCell & UICollectionViewCell>(_ cell: T.Type) {
		self.register(cell, forCellWithReuseIdentifier: cell.reuseId)
	}
}
