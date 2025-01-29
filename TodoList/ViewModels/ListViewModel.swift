//
//  ListViewModel.swift
//  TodoList
//
//  Created by sarmad on 1/29/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var taskArray: [taskModel] = [] {
        didSet {
            saveData()
        }
    }
    let userDefaultkey = "list_data"
    
    init() {
        getTasks()
    }
    
    func getTasks() {
//        let newTasks = [
//            taskModel(title: "This is the first Title", isCompleted: true),
//            taskModel(title: "This is the second title", isCompleted: false),
//            taskModel(title: "This is the third", isCompleted: false)
//        ]
//
//        taskArray.append(contentsOf: newTasks)
        guard let data = UserDefaults.standard.data(forKey: userDefaultkey) else {return}
            
        guard let decodedData = try? JSONDecoder().decode([taskModel].self, from: data) else {return}
        
        self.taskArray = decodedData
        
        
    }
    
    func addTask(title: String) {
        let newItem = taskModel(title: title, isCompleted: false)
        taskArray.append(newItem)
    }
    
    func updateTask(task: taskModel) {
        if let index = taskArray.firstIndex(where: {$0.id == task.id}) {
            taskArray[index] = task.updateTask()
        }
    }
    
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(taskArray) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultkey)
        }
    }

}
