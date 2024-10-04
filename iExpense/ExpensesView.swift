//
//  ExpensesView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 04/10/24.
//

import SwiftUI

struct ExpensesView: View {
    var name: String
    var expenses: Expenses
    
    var body: some View {
        Section(name) {
            ForEach(expenses.items) { item in
                if item.type == name {
                    HStack {
                        
                        VStack {
                            var sfSymbol: String {
                                switch item.type {
                                case "Personal":
                                    return "person.crop.square.on.square.angled.fill"
                                case "Business":
                                    return "building.2.fill"
                                default:
                                    return "globe"
                                }
                            }
      
                            Image(systemName: sfSymbol)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        // Challenge 1: Use the user’s preferred currency, rather than always using US dollars.
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(colorFor(amount: item.amount)) // Challenge 2
                        
                    }
                    
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
        print(expenses.items)
    }
    
    // Challenge 2: Modify the expense amounts in ContentView to contain some styling depending on their value – expenses under $10 should have one style, expenses under $100 another, and expenses over $100 a third style. What those styles are depend on you.
    func colorFor(amount: Decimal) -> Color {
        switch amount {
        case ..<Decimal(10.00): return .green
        case ..<Decimal(100.00): return .orange
        default: return .red
        }
    }
}

#Preview {
    ExpensesView(name: "Personal", expenses: Expenses())
}
