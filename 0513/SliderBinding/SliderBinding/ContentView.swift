//
//  ContentView.swift
//  SliderBinding
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 1.0
    
    var body: some View {
        VStack {
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .scaleEffect(scale)
            Slider(value: $scale, in: 0...1)
            let scaleText = String(format: "%.2f", scale)
            Text("Scale: \(scaleText)")
                
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
