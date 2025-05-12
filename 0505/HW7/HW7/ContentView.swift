//
//  ContentView.swift
//  HW7
//
//  Created by 張睿恩 on 2025/5/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("About Oiia Cat")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                // Image (Asset)
                Image("oiia_cat") // Ensure "oiia_cat" is added to Assets
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .padding(.horizontal)

                // Description
                Text("Oiia Cat is a viral meme known for its quirky expressions and relatable captions. This iconic cat has captured the hearts of meme enthusiasts worldwide.")
                    .font(.body)
                    .padding(.horizontal)

                // Fun Facts Section
                VStack(alignment: .leading, spacing: 10) {
                    ExtractedView(image: "pawprint.fill", text: "Fun Fact 1: Oiia Cat's memes have been shared millions of times!")
                    ExtractedView(image: "star.fill", text: "Fun Fact 2: The cat's unique expression is often used to depict confusion or surprise.")
                    ExtractedView(image: "globe", text: "Fun Fact 3: Oiia Cat has a dedicated fanbase that creates new memes daily.")
                }
                .padding(.horizontal)

                // ZStack for Highlight
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.blue.opacity(0.2))
                        .frame(height: 150)
                        .shadow(radius: 5)

                    Text("Oiia Cat represents the perfect mix of humor and cuteness, making it a timeless internet sensation.")
                        .font(.body)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(.orange)
                .frame(width: 50, height: 50)   
            Text(text)
                .font(.headline)
        }
    }
}
