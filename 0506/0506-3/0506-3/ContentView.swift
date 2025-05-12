//
//  ContentView.swift
//  0506-3
//
//  Created by 張睿恩 on 2025/5/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("First Page")
                NavigationLink("Go") {
                    SecondView()
                }
            }
            .navigationTitle("First Page")
        }
    }
}

#Preview {
    ContentView()
}
