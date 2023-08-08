//
//  AddNewTaskView.swift
//  ProjectOneSarah
//
//  Created by Sarah on 04/08/2023.
//

import SwiftUI

struct AddNewTaskView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @EnvironmentObject var listViewModel: TaskViewModel
    
    @State var title: String = ""
    @State var description: String = ""
    @State var priority: TaskPriority = .Low
    @State var status: TaskStatus = .Done
    
    @State var AlertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Title", text: $title)
                        
                        TextField("Description", text: $description, axis: .vertical)
                            .lineLimit(4, reservesSpace: true)
                    } header: {
                        Text("")
                            .foregroundColor(.black)
                            .bold()
                    }
                    
                    Section {
                        Picker("", selection: $priority) {
                            Text("Low")
                                .tag(TaskPriority.Low)
                            Text("Medium")
                                .tag(TaskPriority.Medium)
                            Text("High")
                                .tag(TaskPriority.High)
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Priority")
                            .foregroundColor(.black)
                            .bold()
                    }
                    
                    Section {
                        Picker("", selection: $status) {
                            Text("Backlog")
                                .tag(TaskStatus.Backlog)
                            Text("Todo")
                                .tag(TaskStatus.Todo)
                            Text("InProgress")
                                .tag(TaskStatus.InProgress)
                            Text("Done")
                                .tag(TaskStatus.Done)
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    } header: {
                        Text("Status")
                            .foregroundColor(.black)
                            .bold()
                    }
                    
                }
                .scrollContentBackground(.hidden)
                
                Button {
                    saveItem()
                } label: {
                    Text("Add")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(15)
                        .padding()
                }
            }
            .background {
                Image("background")
            }
            .navigationTitle("Add New Task")
        }
        
        
        
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    func saveItem() {
        if isValidForm() {
            let item = TaskModel(id: UUID(),
                                 title: title,
                                 description: description,
                                 status: status,
                                 priority: priority
            )
            listViewModel.addItem(item: item)
            dismiss()
        }
    }
    
    func isValidForm() -> Bool {
        AlertTitle = ""
        if title.count < 3 {
            AlertTitle = "The title should be at least 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
    func getAlert() -> Alert {
        return Alert(title: Text(AlertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddNewTaskView()
        }
        .environmentObject(TaskViewModel())
    }
}
