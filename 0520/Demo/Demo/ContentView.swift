//
//  ContentView.swift
//  Demo
//
//  Created by 張睿恩 on 2025/5/20.
//

import SwiftUI

struct ContentView: View {
    @State private var weather: String = ""
    
    var body: some View {
        VStack {
            Text(weather)
            Button("Get Weather") {
                if let url = URL(string: "https://wttr.in/台北?format=3") {
                    Task {
                        do {
                            let (data, _) = try await URLSession.shared.data(from: url)
                            if let weatherString = String(data: data, encoding: .utf8) {
                                weather = weatherString
                            }
                        } catch {
                            print("Error fetching weather: \(error)")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
