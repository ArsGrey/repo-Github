//
//  UniqueIdentifyable.swift
//  AwesomeNotes
//
//  Created by tichenko.r on 20.10.2020.
//  Copyright © 2020 Роман Тищенко. All rights reserved.
//

import Foundation

/// Protocol for defining entity with uniqe identifier.
protocol UniqueIdentifyable: Hashable {
	associatedtype Identifier: Hashable
	var id: Identifier { get }
}
