
import SwiftUI

struct DataTaskView: View {
  
    @Environment (\.dismiss) var dismiss
    
    @EnvironmentObject var listViewModel: TaskViewModel
    
    @State var title: String = ""
    @State var description: String = ""
    @State var priority: TaskPriority = .low
    @State var status: TaskStatus = .backlog
    
    @State var alertTitle: String = ""
    
    @State var showAlert: Bool = false
    @State var isEdit: Bool = false
    
    let item : TaskModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Task Title", text: $title)
                    TextField("Task Description", text: $description, axis: .vertical)
                        .lineLimit(4, reservesSpace: true)
                } header: {
                    Text("")
                        .foregroundColor(.black)
                        .bold()
                }
                
                Section {
                    Picker("", selection: $priority) {
                        Text("Low")
                            .tag(TaskPriority.low)
                        Text("Medium")
                            .tag(TaskPriority.medium)
                        Text("High")
                            .tag(TaskPriority.high)
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
                            .tag(TaskStatus.backlog)
                        Text("Todo")
                            .tag(TaskStatus.todo)
                        Text("In-Progress")
                            .tag(TaskStatus.inProgress)
                        Text("Done")
                            .tag(TaskStatus.done)
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
            .disabled(!isEdit)
            
            if isEdit {
                Button {

                } label: {
                    Text("UPDATE")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
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
        DataTaskView(item: TaskModel.sample)
    }
}
