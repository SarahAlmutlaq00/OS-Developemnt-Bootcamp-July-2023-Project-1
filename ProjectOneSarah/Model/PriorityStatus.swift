

import Foundation
import SwiftUI



enum TaskStatus: Codable {
    case backlog, todo, inProgress, done
}

enum TaskPriority: Codable {
    case low, medium, high
}
