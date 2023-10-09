//
//  TaskProtocol.swift
//  ToDoList
//
//  Created by Tulai Dima on 9.10.23.
//

import Foundation

protocol TaskProtocol {
    var title: String { get set }
    var isCompleted: Bool { get set }
    var priority: Priority { get }
}

