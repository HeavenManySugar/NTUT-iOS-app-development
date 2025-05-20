//
//  QuizView.swift
//  HW9
//
//  Created by 張睿恩 on 2025/5/20.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Quiz App")
            
            QuestionCountPicker(
                questionCount: $viewModel.questionCount,
                isDisabled: viewModel.currentQuestionIndex > 0,
                onChange: viewModel.handleQuestionCountChange
            )

            Spacer()
            
            ProgressView(
                currentQuestionIndex: viewModel.currentQuestionIndex,
                totalQuestions: viewModel.activeQuestions.count,
                score: viewModel.score,
                animatingScore: viewModel.animatingScore
            )
            
            if viewModel.currentQuestionIndex < viewModel.activeQuestions.count {
                QuestionView(viewModel: viewModel)
            }
            
            Spacer()
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(
                title: Text(viewModel.alertTitle),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("Next")) {
                    withAnimation {
                        viewModel.nextQuestion()
                    }
                }
            )
        }
    }
}

struct QuestionView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        VStack {
            Text(viewModel.currentQuestion.text)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)

            AnswerOptionsView(viewModel: viewModel)
        }
    }
}

struct AnswerOptionsView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        VStack(spacing: 15) {
            ForEach(0..<3) { index in
                AnswerButton(
                    text: viewModel.currentQuestion.options[index],
                    isSelected: viewModel.selectedOption == index,
                    action: {
                        viewModel.checkAnswer(index)
                    }
                )
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @StateObject var quizViewModel = QuizViewModel()
    VStack {
        if !quizViewModel.gameOver {
            QuizView(viewModel: quizViewModel)
        } else {
            GameOverView(viewModel: quizViewModel)
        }
    }
    .onAppear {
        quizViewModel.startNewGame()
    }
}
