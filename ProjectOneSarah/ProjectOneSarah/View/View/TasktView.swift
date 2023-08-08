//
//  TaskView.swift
//  ProjectOneSarah
//
//  Created by Sarah on 04/08/2023.
//

import SwiftUI

struct TaskView: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    @State var showAddView: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        List {
            ForEach(taskViewModel.listItems) { item in
                
                NavigationLink(destination: DataTaskView(item: item)) {
                    ListRowView(item: item)
                }
            }
            .onDelete(perform: taskViewModel.deleteItem)
        }
        .listStyle(.plain)
        .searchable(text: $taskViewModel.searchText)
        .onChange(of: taskViewModel.searchText, perform: taskViewModel.filterItems)
        
        .navigationTitle("Tasks")
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Picker("Status", selection: $taskViewModel.selectedStatus) {
                        Text("Backlog").tag(TaskStatus.Backlog as TaskStatus?)
                        Text("Todo").tag(TaskStatus.Todo as TaskStatus?)
                        Text("InProgress").tag(TaskStatus.InProgress as TaskStatus?)
                        Text("Done").tag(TaskStatus.Done as TaskStatus?)
                    }
                    .onChange(of: taskViewModel.selectedStatus, perform: taskViewModel.filterItems)

                    Button(role: .destructive) {
                        taskViewModel.selectedStatus = nil
                    } label: {
                        Text("all")
                    }
                    .disabled(taskViewModel.selectedStatus == nil)
                } label: {
                    Image(systemName: "ellipsis.rectangle")
                        .font(.largeTitle)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                       
                }
            }
        }
        .sheet(isPresented: $showAddView) {
            AddNewTaskView()
        }
        .scrollContentBackground(.hidden)
            .background {
                Image("background")
                
            }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TaskView()
            
        }
        .environmentObject(TaskViewModel())
    }
    
}
