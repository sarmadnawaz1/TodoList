//
//  ListView.swift
//  TodoList
//
//  Created by sarmad on 1/26/25.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    
    @State var addViewPresented: Bool = false
    
    var body: some View {
        ZStack {
            
            
            List {
                ForEach(listViewModel.taskArray) { task in
                    ListRowView(title: task.title, isCompleted: task.isCompleted).onTapGesture {
                        withAnimation {
                            listViewModel.updateTask(task: task)
                        }
                    }
                }
                .onDelete { index in
                    listViewModel.taskArray.remove(atOffsets: index)
                }
                .onMove { indexSet, offset in
                    listViewModel.taskArray.move(fromOffsets: indexSet, toOffset: offset)
                }
                
            }
            .navigationTitle("Todo List 📝")
            .navigationBarItems(leading: EditButton(),
                                trailing: addButton
                .sheet(isPresented: $addViewPresented, content: {
                    AddView()
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                        .background(.ultraThinMaterial)
            }))
        }
        
        
    }
    
    var addButton: some View {
        
        Button {
            addViewPresented.toggle()
        } label: {
            Image(systemName: "plus.circle").foregroundColor(.blue)
        }

        
            
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
        
    }
}
