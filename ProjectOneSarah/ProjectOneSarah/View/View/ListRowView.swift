//
//  ListRowView.swift
//  ProjectOneSarah
//
//  Created by Sarah on 04/08/2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item : TaskModel
    
    var body: some View {
        HStack {
            Image (systemName: item.status == .Done ? "checkmark.circle" : "circle" )
                .foregroundColor(item.status == .Done ? .green : .red)
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
            ListRowView(item: TaskModel.Sample)
        }
    }
}
