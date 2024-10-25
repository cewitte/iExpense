//
//  ContentView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 29/09/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Decimal
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
    var containsBusinessItem: Bool {
        items.contains(where: { $0.type == "Business" })
    }
    
    var containsPersonalItem: Bool {
        items.contains(where: { $0.type == "Personal" })
    }
    
    var containsOtherItem: Bool {
        items.contains(where: { $0.type == "Other" })
    }
    
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                if expenses.containsBusinessItem {
                    ExpensesView(name: "Business", expenses: expenses)
                }
                               
                if expenses.containsPersonalItem {
                    ExpensesView(name: "Personal", expenses: expenses)
                }
                
                if expenses.containsOtherItem {
                    ExpensesView(name: "Other", expenses: expenses)
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
        
    }
}

#Preview {
    ContentView()
}
