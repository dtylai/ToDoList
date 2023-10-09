//
//  TaskManager.swift
//  ToDoList
//
//  Created by Tulai Dima on 9.10.23.
//

import Foundation


class TaskManager<T: TaskCategoryProtocol> {
    var categories: [T] = []
    
    func addCategory(category: T) {
        categories.append(category)
    }
    
    func addTask(categoryIndex: Int, task: TaskProtocol) -> Result<Void, TaskError> {
        guard categoryIndex >= 0, categoryIndex < categories.count else {
            return .failure(.categoryNotFound)
        }
        
        categories[categoryIndex].addTask(task: task)
        return .success(())
    }
    
    func markTaskAsCompleted(categoryIndex: Int, taskIndex: Int) -> Result<Void, TaskError> {
        guard categoryIndex >= 0, categoryIndex < categories.count else {
            return .failure(.categoryNotFound)
        }
        
        guard taskIndex >= 0, taskIndex < categories[categoryIndex].tasks.count else {
            return .failure(.taskNotFound)
        }
        
        categories[categoryIndex].tasks[taskIndex].isCompleted = true
        return .success(())
    }
    
    func removeTask(categoryIndex: Int, taskIndex: Int) -> Result<Void, TaskError> {
        guard categoryIndex >= 0, categoryIndex < categories.count else {
            return .failure(.categoryNotFound)
        }
        
        guard taskIndex >= 0, taskIndex < categories[categoryIndex].tasks.count else {
            return .failure(.taskNotFound)
        }
        
        categories[categoryIndex].tasks.remove(at: taskIndex)
        return .success(())
    }
}

