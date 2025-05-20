//
//  ContentView.swift
//  HW9
//
//  Created by 張睿恩 on 2025/5/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var quizViewModel = QuizViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                if !quizViewModel.gameOver {
                    QuizView(viewModel: quizViewModel)
                } else {
                    GameOverView(viewModel: quizViewModel)
                }
            }
            .padding()
            .onAppear {
                quizViewModel.startNewGame()
            }
        }
    }
}


#Preview {
    ContentView()
}
