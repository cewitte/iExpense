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
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
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
