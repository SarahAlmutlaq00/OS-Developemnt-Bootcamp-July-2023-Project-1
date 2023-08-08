//
//  PriorityStatus.swift
//  ProjectOneSarah
//
//  Created by Sarah on 04/08/2023.
//

import Foundation
import SwiftUI



enum TaskStatus: Codable {
    case Backlog
    case Todo
    case InProgress
    case Done
}

enum TaskPriority: Codable {
    case Low
    case Medium
    case High
}
