//
//  ExpensesView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 06/04/25.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    
    @State private var showingAddExpense = false
    
    var body: some View {
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
    }
    
    init(sortOrder: [SortDescriptor<Expense>], type: String) {
        _expenses = Query(filter: #Predicate<Expense> { expense in
            if type == "All" {
                return true
            } else if expense.type == type {
                return true
            } else {
                return false
            }
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let expense = expenses[index] // Obtém o item real
            modelContext.delete(expense)  // Deleta o item do contexto
        }
    }
}

#Preview {
    ExpensesView(sortOrder: [SortDescriptor(\Expense.type)], type: "All")
        .modelContainer(for: Expense.self)
}
