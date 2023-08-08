//
//  ProjectOneSarahApp.swift
//  ProjectOneSarah
//
//  Created by Sarah on 04/08/2023.
//

import SwiftUI

@main
struct ProjectOneSarahApp: App {
    
    @StateObject var listViewModel: TaskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
               TaskView()
            }
            .environmentObject(listViewModel)
        }
    }
}
