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
    
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount)
    ]
    
    var body: some View {
        NavigationStack {
            ExpensesView(sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add Expense", systemImage: "plus") {
                            showingAddExpense = true
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu("Sort", systemImage: "arrow.up.arrow.down"){
                            Picker("Sort", selection: $sortOrder){
                                Text("Sort by Name")
                                    .tag([
                                        SortDescriptor(\Expense.name),
                                        SortDescriptor(\Expense.amount)
                                    ])
                                
                                Text("Sort by Amount")
                                    .tag([
                                        SortDescriptor(\Expense.amount),
                                        SortDescriptor(\Expense.name)
                                    ])
                            }
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
