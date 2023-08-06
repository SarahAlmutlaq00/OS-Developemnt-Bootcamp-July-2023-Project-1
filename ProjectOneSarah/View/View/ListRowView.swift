

import SwiftUI

struct ListRowView: View {
    
    let item : TaskModel
    
    var body: some View {
        HStack {
            Image (systemName: item.status == .done ? "checkmark.circle" : "circle" )
                .foregroundColor(item.status == .done ? .green : .red)
            Text(item.title)
            Spacer ()
        }
        .font(.title)
        .padding(.vertical)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListRowView(item: TaskModel.sample)
        }
    }
}
