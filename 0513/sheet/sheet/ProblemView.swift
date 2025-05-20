//
//  ProblemView.swift
//  sheet
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct ProblemView: View {
    @State private var isShowingAnswer = false
    
    var body: some View {
        VStack {
            Button("小王子去過幾星球？") {
                isShowingAnswer = true
            }
            .sheet(isPresented: $isShowingAnswer) {
                AnswerView()
            }
        }
    }
}

#Preview {
    ProblemView()
}
