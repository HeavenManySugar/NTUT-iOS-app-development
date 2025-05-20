//
//  QuizViewModel.swift
//  HW9
//
//  Created by 張睿恩 on 2025/5/20.
//

import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var questions = Question.sampleQuestions
    @Published var questionCount = 2
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var showingAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var gameOver = false
    @Published var activeQuestions: [Question] = []
    @Published var selectedOption: Int? = nil
    @Published var animatingScore = false
    
    var currentQuestion: Question {
        activeQuestions[min(currentQuestionIndex, activeQuestions.count - 1)]
    }
    
    func handleQuestionCountChange() {
        if currentQuestionIndex == 0 {
            startNewGame()
        }
    }
    
    func startNewGame() {
        score = 0
        currentQuestionIndex = 0
        gameOver = false
        selectedOption = nil
        
        // Make sure we don't try to get more questions than we have
        let count = min(questionCount, questions.count)
        activeQuestions = Array(questions.shuffled().prefix(count))
    }
    
    func checkAnswer(_ selectedIndex: Int) {
        selectedOption = selectedIndex
        
        let correctIndex = currentQuestion.correctAnswerIndex
        let pointsPerQuestion = 100 / activeQuestions.count
        
        if selectedIndex == correctIndex {
            score += pointsPerQuestion
            alertTitle = "Correct!"
            alertMessage = "Good job!"
            animateScore()
        } else {
            alertTitle = "Wrong!"
            alertMessage = "The correct answer is: \(currentQuestion.options[correctIndex])"
        }
        
        showingAlert = true
    }
    
    private func animateScore() {
        withAnimation {
            animatingScore = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.animatingScore = false
        }
    }
    
    func nextQuestion() {
        selectedOption = nil
        
        if currentQuestionIndex + 1 < activeQuestions.count {
            currentQuestionIndex += 1
        } else {
            gameOver = true
        }
    }
}
