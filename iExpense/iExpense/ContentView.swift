//
//  ContentView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 29/09/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses : [Expense]
    
    @State private var showingAddExpense = false
    
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount)
    ]
    
    @State private var type = "All"
    
    let types = ["All", "Personal", "Business", "Other"]
    
    var body: some View {
        NavigationStack {
            ExpensesView(sortOrder: sortOrder, type: type)
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
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu("Type", systemImage: "line.3.horizontal.decrease.circle"){
                            Picker("Types", selection: $type) {
                                ForEach(types, id: \.self) { key in
                                    Text(key)
                                }
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
}

#Preview {
    ContentView()
}
