//
//  ContentView.swift
//  Binding
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false

    var body: some View {
        VStack {
            PlayerView(isPlaying: isPlaying)
                .padding()

            PlayerButton(isPlaying: $isPlaying)
                .padding()
        }
        .padding()
    }
}

struct PlayerView: View {
    var isPlaying: Bool

    var body: some View {
        VStack {
            Text("Player")
                .font(.largeTitle)
                .padding()
            Text(isPlaying ? "Playing" : "Paused")
                .font(.title)
                .padding()
        }
    }
}

struct PlayerButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(action: {
            isPlaying.toggle()
        }) {
            Text(isPlaying ? "Pause" : "Play")
                .font(.title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

}

#Preview {
    ContentView()
}
