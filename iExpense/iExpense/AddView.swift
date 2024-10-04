//
//  AddView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 02/10/24.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Decimal = 0.0
    
    let types = ["Personal", "Business", "Other"]
    
    var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                // Challenge 1: Use the user’s preferred currency, rather than always using US dollars.
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    
                    expenses.items.append(item)
                    
                    dismiss()
                }
            }
        }
                    
    }
}

#Preview {
    AddView(expenses: Expenses())
}

