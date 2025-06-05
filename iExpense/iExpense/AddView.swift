//
//  AddView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 02/10/24.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Decimal = 0.0
    
    let types = ["Personal", "Business", "Other"]
    
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    
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
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let item = Expense(name: name, type: type, amount: amount)
                        modelContext.insert(item)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView()
        .modelContainer(for: Expense.self)
}
