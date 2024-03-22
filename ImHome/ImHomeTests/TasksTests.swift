// FILEPATH: /Users/gk/projects/ImHome/ImHome/TasksTests.swift
import XCTest
@testable import ImHome

final class TasksTests: XCTestCase {
    func testTaskNameModificationAfterCompletion() {
        // Create a task
        var task = Task(name: "Test Task", isCompleted: false)
        
        // Complete the task
        task.isCompleted = true
        
        // Modify the name of the task
        let newName = "Modified Task"
        task.name = newName
        
        // Assert that the task name has been modified correctly
        XCTAssertEqual(task.name, newName, "The task name was not modified correctly after completion.")
    }
}