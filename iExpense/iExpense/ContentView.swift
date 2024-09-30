//
//  ContentView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 29/09/24.
//

import SwiftUI

@Observable
class User {
    var firstName = "Luke"
    var lastName = "Skywalker"
}

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
        
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
        
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView: View {
    @State private var user: User = User()
    @State private var showingSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("The Jedi's name is \(user.firstName) \(user.lastName).")
            
            TextField("First Name: ", text: $user.firstName)
            TextField("Last Name: ", text: $user.lastName)
            
            Button("Show Sheet") {
                // show the sheet
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "@twostraws")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
