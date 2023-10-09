//
//  ToDoListTests.swift
//  ToDoListTests
//
//  Created by Tulai Dima on 9.10.23.
//

import XCTest
@testable import ToDoList

class TaskTests: XCTestCase {
    func testTaskInitialization() {
        let task = Task(title: "Test Task", priority: .medium)
        XCTAssertEqual(task.title, "Test Task")
        XCTAssertFalse(task.isCompleted)
        XCTAssertEqual(task.priority, .medium)
    }
}

class TaskCategoryTests: XCTestCase {
    func testTaskCategoryInitialization() {
        let category = TaskCategory(name: "Test Category")
        XCTAssertEqual(category.name, "Test Category")
        XCTAssertTrue(category.tasks.isEmpty)
    }
    
    func testAddTaskToCategory() {
        let category = TaskCategory(name: "Test Category")
        let task = Task(title: "Test Task", priority: .medium)
        category.addTask(task: task)
        XCTAssertEqual(category.tasks.count, 1)
        XCTAssertEqual(category.tasks.first?.title, "Test Task")
    }
    
    func testGetTasksByPriority() {
        let category = TaskCategory(name: "Test Category")
        let highPriorityTask = Task(title: "High Priority Task", priority: .high)
        let lowPriorityTask = Task(title: "Low Priority Task", priority: .low)
        
        category.addTask(task: highPriorityTask)
        category.addTask(task: lowPriorityTask)
        
        let highPriorityTasks = category.getTasks(priority: .high)
        XCTAssertEqual(highPriorityTasks.count, 1)
        XCTAssertEqual(highPriorityTasks.first?.title, "High Priority Task")
    }
}

class TaskManagerTests: XCTestCase {
    func testAddCategoryToTaskManager() {
        let taskManager = TaskManager<TaskCategory>()
        let category = TaskCategory(name: "Test Category")
        taskManager.addCategory(category: category)
        XCTAssertEqual(taskManager.categories.count, 1)
        XCTAssertEqual(taskManager.categories.first?.name, "Test Category")
    }
    
    func testAddTaskToCategoryInTaskManager() {
        let taskManager = TaskManager<TaskCategory>()
        let category = TaskCategory(name: "Test Category")
        taskManager.addCategory(category: category)
        
        let newTask = Task(title: "New Task", priority: .medium)
        let result = taskManager.addTask(categoryIndex: 0, task: newTask)
        
        switch result {
        case .success:
            XCTAssertEqual(category.tasks.count, 1)
            XCTAssertEqual(category.tasks.first?.title, "New Task")
        case .failure(let error):
            XCTFail("Failed to add task with error: \(error)")
        }
    }
    
    func testMarkTaskAsCompleted() {
        let taskManager = TaskManager<TaskCategory>()
        let category = TaskCategory(name: "Test Category")
        let task = Task(title: "Task to mark", priority: .medium)
        category.addTask(task: task)
        taskManager.addCategory(category: category)

        let result = taskManager.markTaskAsCompleted(categoryIndex: 0, taskIndex: 0)
        switch result {
        case .success:
            XCTAssertTrue(category.tasks.first?.isCompleted ?? false) // Проверяем, что задание помечено как выполненное
        case .failure(let error):
            XCTFail("Failed to mark task as completed with error: \(error)")
        }
    }

    func testRemoveTask() {
        let taskManager = TaskManager<TaskCategory>()
        let category = TaskCategory(name: "Test Category")
        let task = Task(title: "Task to remove", priority: .medium)
        category.addTask(task: task)
        taskManager.addCategory(category: category)

        let result = taskManager.removeTask(categoryIndex: 0, taskIndex: 0)
        switch result {
        case .success:
            XCTAssertTrue(category.tasks.isEmpty) // Проверяем, что задание было удалено из категории
        case .failure(let error):
            XCTFail("Failed to remove task with error: \(error)")
        }
    }
}
