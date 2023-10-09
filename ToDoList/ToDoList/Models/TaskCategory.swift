//
//  TaskCategory.swift
//  ToDoList
//
//  Created by Tulai Dima on 9.10.23.
//

import Foundation


class TaskCategory: TaskCategoryProtocol {
    var name: String
    var tasks: [TaskProtocol]
    
    init(name: String) {
        self.name = name
        self.tasks = []
    }
    
    func addTask(task: TaskProtocol) {
        tasks.append(task)
    }
    
    func getTasks(priority: Priority) -> [TaskProtocol] {
        return tasks.filter { $0.priority == priority && !$0.isCompleted }
    }
}
