//
//  GameOverView.swift
//  HW9
//
//  Created by 張睿恩 on 2025/5/20.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Quiz Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your score: \(viewModel.score) / 100")
                .font(.title)
                .fontWeight(.semibold)
            
            Button("Play Again") {
                withAnimation {
                    viewModel.startNewGame()
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    GameOverView(viewModel: QuizViewModel())
}
