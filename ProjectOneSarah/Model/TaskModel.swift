


import Foundation

struct TaskModel: Identifiable, Codable {
    
    static let sample = TaskModel(id: UUID(), title: "sample", description: "", status: .backlog, priority: .high)
    
    let id: UUID
    let title: String
    let description: String
    let status: TaskStatus
    let priority : TaskPriority
    
    init(id: UUID, title: String, description: String, status: TaskStatus, priority: TaskPriority) {
        self.id = id
        self.title = title
        self.description = description
        self.status = status
        self.priority = priority
    }
}

