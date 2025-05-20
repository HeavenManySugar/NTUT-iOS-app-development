//
//  ContentView.swift
//  Animation
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct ContentView: View {
    @State private var offset: Double = 0
    @State private var scale: Double = 1
    var body: some View {
        VStack {
            Image(systemName: "star")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .offset(y: offset)
                .scaleEffect(scale)
            
            Button("Move"){
                withAnimation(.easeInOut(duration: 5)) {
                    offset = .random(in: -200...200)
                    scale = 3
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
