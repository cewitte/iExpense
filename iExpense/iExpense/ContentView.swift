//
//  ContentView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 29/09/24.
//

import SwiftUI
import SwiftData

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Decimal
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses : [Expense]
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                }
            }
            .background(
                NavigationLink("", destination: AddView(), isActive: $showingAddExpense)
                    .hidden()
            )
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let expense = expenses[index] // Obtém o item real
            modelContext.delete(expense)  // Deleta o item do contexto
        }
    }
}

#Preview {
    ContentView()
}
