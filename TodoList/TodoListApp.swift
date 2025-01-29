//
//  TodoListApp.swift
//  TodoList
//
//  Created by sarmad on 1/26/25.
//

import SwiftUI

/*
 It is a comment
 
 MVVM ARCHITECTURE
 MODEL: data point
 VIEW: UI user interface
 VIEWMODEL: manages model for the view
*/

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
             
        }
    }
}
