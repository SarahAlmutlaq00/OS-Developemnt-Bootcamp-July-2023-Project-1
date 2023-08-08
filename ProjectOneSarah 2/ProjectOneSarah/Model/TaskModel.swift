//
//  TaskModel.swift
//  ProjectOneSarah
//
//  Created by Sarah on 04/08/2023.
//


import Foundation

struct TaskModel: Identifiable, Codable {
    
    
    
    let id: UUID
    let title: String
    let description: String
    let status: TaskStatus
    let priority : TaskPriority
    
    static let Sample = TaskModel(id: UUID(), title: "sample", description: "", status: .Done , priority: .Low )
    
    init(id: UUID, title: String, description: String, status: TaskStatus, priority: TaskPriority) {
        self.id = id
        self.title = title
        self.description = description
        self.status = status
        self.priority = priority
    }
}

