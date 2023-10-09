//
//  Task.swift
//  ToDoList
//
//  Created by Tulai Dima on 9.10.23.
//

import Foundation


class Task: TaskProtocol {
    var title: String
    var isCompleted: Bool
    var priority: Priority
    
    init(title: String, priority: Priority) {
        self.title = title
        self.isCompleted = false
        self.priority = priority
    }
}
