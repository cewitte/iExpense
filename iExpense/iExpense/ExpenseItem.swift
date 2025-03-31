//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 30/03/25.
//

import Foundation
import SwiftData

@Model
class Expense {
    var id = UUID()
    var name: String
    var type: String
    var amount: Decimal
    
    init(name: String, type: String, amount: Decimal) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
