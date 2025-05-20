//
//  ContentView.swift
//  SliderPractice
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct ContentView: View {
    @State private var RedValue: Double = 0
    @State private var GreenValue: Double = 0
    @State private var BlueValue: Double = 0
    @State private var OpacityValue: Double = 1
    
    init() {
        _RedValue = State(initialValue: Double.random(in: 0...1))
        _GreenValue = State(initialValue: Double.random(in: 0...1))
        _BlueValue = State(initialValue: Double.random(in: 0...1))
    }
    
    var body: some View {
        VStack {
            Text("顏色調整器")
                .font(.title)
                .bold()
            Rectangle()
                .foregroundColor(Color(red: RedValue, green: GreenValue, blue: BlueValue, opacity: OpacityValue))
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .padding()
            Text("紅色")
            Slider(value: $RedValue, in: 0...1)
                .padding()
            Text("綠色")
            Slider(value: $GreenValue, in: 0...1)
                .padding()
            Text("藍色")
            Slider(value: $BlueValue, in: 0...1)
                .padding()
            Text("透明度")
            Slider(value: $OpacityValue, in: 0...1)
                .padding()
            Button("隨機顏色") {
                RedValue = Double.random(in: 0...1)
                GreenValue = Double.random(in: 0...1)
                BlueValue = Double.random(in: 0...1)
            }
            .font(.headline)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
