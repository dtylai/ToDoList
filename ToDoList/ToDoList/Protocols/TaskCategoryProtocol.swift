//
//  TaskCategoryProtocol.swift
//  ToDoList
//
//  Created by Tulai Dima on 9.10.23.
//

import Foundation

protocol TaskCategoryProtocol {
    var name: String { get }
    var tasks: [TaskProtocol] { get set }
    
    func addTask(task: TaskProtocol)
    func getTasks(priority: Priority) -> [TaskProtocol]
}
