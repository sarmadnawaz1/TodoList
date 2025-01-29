//
//  AddView.swift
//  TodoList
//
//  Created by sarmad on 1/29/25.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showAlert: Bool = false
    
    var body: some View {
        
        
            VStack(spacing: 20) {
                Spacer()
                    TextField("New task", text: $textFieldText)
                        .padding()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
                        .cornerRadius(20)
                    Button {
                        
                        if textIsAppropriate() {
                            listViewModel.addTask(title: textFieldText)
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    } label: {
                        Text("Add")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }

                    .alert(isPresented: $showAlert) {
                         Alert(title: Text("Task must be more than 3 characters long!!"))
                    }
                Spacer()
                Spacer()
                    
                }
                .padding()
                .padding(.horizontal)
                .background(.ultraThinMaterial)

                
        
        
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count > 3 {
            return true
        }
        showAlert.toggle()
        return false
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
