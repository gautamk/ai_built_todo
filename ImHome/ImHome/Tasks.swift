import Foundation

/// Represents a task.
struct Task: Identifiable, Codable {
    /// The unique identifier of the task.
    var id = UUID()
    
    /// The name of the task.
    var name: String
    
    /// Indicates whether the task is completed or not.
    var isCompleted: Bool
}