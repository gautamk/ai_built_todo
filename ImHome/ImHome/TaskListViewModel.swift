import Combine
import Foundation

/// A view model that manages a list of tasks.
class TaskListViewModel: ObservableObject {
        @Published var tasks: [Task] {
        didSet {
            saveTasks()
        }
    }

    init() {
        if let data = UserDefaults.standard.data(forKey: "tasks"),
           let tasks = try? JSONDecoder().decode([Task].self, from: data) {
            self.tasks = tasks
        } else {
            self.tasks = []
        }
    }

    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: "tasks")
        }
    }

    /// Adds a new task to the list.
    /// - Parameter name: The name of the task.
    func addTask(name: String) {
        let task = Task(name: name, isCompleted: false)
        tasks.append(task)
    }

    /// Deletes tasks at the specified indices.
    /// - Parameter indexSet: The indices of the tasks to be deleted.
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }

    /// Toggles the completion status of a task at the specified index.
    /// - Parameter index: The index of the task to be toggled.
    func toggleTaskCompletion(at index: Int) {
        tasks[index].isCompleted.toggle()
    }
    
    func updateTaskName(at index: Int, to newName: String) {
        tasks[index].name = newName
    }
}