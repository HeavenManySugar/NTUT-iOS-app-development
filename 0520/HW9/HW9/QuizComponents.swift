//
//  QuizComponents.swift
//  HW9
//
//  Created by 張睿恩 on 2025/5/20.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color.blue.opacity(0.1).ignoresSafeArea()
    }
}

struct HeaderView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
    }
}

struct QuestionCountPicker: View {
    @Binding var questionCount: Int
    let isDisabled: Bool
    let onChange: () -> Void

    var body: some View {
        Picker("Number of Questions", selection: $questionCount) {
            Text("2 Questions").tag(2)
            Text("5 Questions").tag(5)
            Text("10 Questions").tag(10)
        }
        .pickerStyle(.segmented)
        .padding()
        .disabled(isDisabled)
        .onChange(of: questionCount) { _, _ in
            onChange()
        }
    }
}

struct ProgressView: View {
    let currentQuestionIndex: Int
    let totalQuestions: Int
    let score: Int
    let animatingScore: Bool

    var body: some View {
        Group {
            Text("Question \(currentQuestionIndex + 1) of \(totalQuestions)")
                .font(.headline)

            Text("Score: \(score)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .scaleEffect(animatingScore ? 1.5 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: animatingScore)
        }
    }
}

struct AnswerButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isSelected ? Color.orange : Color.blue)
                )
        }
        .buttonStyle(PlainButtonStyle())
        .transition(.scale)
    }
}
