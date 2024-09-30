//
//  ContentView.swift
//  iExpense
//
//  Created by Carlos Eduardo Witte on 29/09/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap me! Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
