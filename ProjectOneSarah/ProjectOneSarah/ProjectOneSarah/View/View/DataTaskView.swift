//
//  DataTaskView.swift
//  ProjectOneSarah
//
//  Created by Sarah on 04/08/2023.
//
import SwiftUI

struct DataTaskView: View {
  
    @Environment (\.dismiss) var dismiss
    
    @EnvironmentObject var listViewModel: TaskViewModel
    
    @State var title: String = ""
    @State var description: String = ""
    @State var priority: TaskPriority = .Low
    @State var status: TaskStatus = .Done
    
    @State var alertTitle: String = ""
    
    @State var showAlert: Bool = false
    @State var isEdit: Bool = false
    
    let item : TaskModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Title", text: $title , axis: .vertical)
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
                        .foregroundColor(.blue)
                        .bold()
                }
                
                Section {
                    Picker("", selection: $status) {
                        Text("Backlog")
                            .tag(TaskStatus.Backlog)
                        Text("Todo")
                            .tag(TaskStatus.Todo)
                        Text("In-Progress")
                            .tag(TaskStatus.InProgress)
                        Text("Done")
                            .tag(TaskStatus.Done)
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                } header: {
                    Text("Status")
                        .foregroundColor(.blue)
                        .bold()
                }
                
            }
            .scrollContentBackground(.hidden)
            .disabled(!isEdit)
            
            if isEdit {
                Button {

                } label: {
                    Text("UPDATE")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .cornerRadius(15)
                        .padding()
                }
            }
        }
        .background {
            Image("background")
        }

        .alert(isPresented: $showAlert, content: getAlert)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isEdit.toggle()
                } label: {
                    Text(isEdit ? "Cancel" : "Edit")
                }
            }
        }
        .onAppear(perform: loadItem)
    }
    
    func loadItem() {
        title = item.title
        description = item.description
        priority = item.priority
        status = item.status
    }
    
    func isValidForm() -> Bool {
        alertTitle = ""
        if title.count < 3 {
            alertTitle = "title should be at least 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }

    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DataTaskView(item: TaskModel.Sample)
    }
}
