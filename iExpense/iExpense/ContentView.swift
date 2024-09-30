//
//  ContentView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 29/09/24.
//

import SwiftUI

struct User: Codable{
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Luke", lastName: "Skywalker")
    @State private var isDataSaved: Bool = false
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
                isDataSaved.toggle()
            }
        }
        .alert(isPresented: $isDataSaved) {
            .init(title: Text("User Saved"), message: nil, dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    ContentView()
}
