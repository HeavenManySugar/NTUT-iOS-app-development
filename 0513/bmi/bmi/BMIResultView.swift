//
//  BMIResultView.swift
//  bmi
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct BMIResultView: View {
    var bmi: Double

    var result: String {
        switch bmi {
        case ..<18.5:
            return "Underweight"
        case 18.5..<24:
            return "Normal"
        case 24..<27:
            return "Overweight"
        case 27..<30:
            return "Mild Obesity"
        case 30..<35:
            return "Moderate Obesity"
        default:
            return "Severe Obesity"
        }
    }

    var advice: String {
        switch bmi {
        case ..<18.5:
            return "You should consider gaining some weight."
        case 18.5..<24:
            return "Keep up the good work!"
        case 24..<27:
            return "Consider more exercise and a healthy diet."
        case 27..<30:
            return "Try to develop better eating habits."
        case 30..<35:
            return "Health risks are increasing. Time to act."
        default:
            return "Consult a doctor for professional advice."
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Your BMI is \(String(format: "%.2f", bmi))")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            Text(result)
                .font(.title2)
                .foregroundColor(.accentColor)

            Text(advice)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .padding()
        .navigationBarTitle("BMI Result", displayMode: .inline)
    }
}

#Preview {
    NavigationView {
        BMIResultView(bmi: 22.5)
    }
}
