//
//  taskModel.swift
//  TodoList
//
//  Created by sarmad on 1/29/25.
//

import Foundation


struct taskModel: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateTask() -> taskModel {
        return taskModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
