//
//  ListRowView.swift
//  TodoList
//
//  Created by sarmad on 1/29/25.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    let isCompleted: Bool
    
    var body: some View {
        HStack {
            if isCompleted {
                Image(systemName: "checkmark.circle.fill")
            } else {
                Image(systemName: "checkmark.circle")
            }
            Text(title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "this is the title", isCompleted: true)
    }
}
