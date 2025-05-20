//
//  ContentView.swift
//  bmi
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct ContentView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bmi: String = ""
    @State private var showResult = false
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("BMI Calculator")
                        .font(.title)
                        .bold()
                        .foregroundColor(.accentColor)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Height (cm)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        TextField("e.g. 170", text: $height)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                        
                        Text("Weight (kg)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        TextField("e.g. 60", text: $weight)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                    }
                    
                    Button(action: {
                        if let height = Double(height), let weight = Double(weight) {
                            let heightMeters = height / 100
                            let bmiValue = weight / (heightMeters * heightMeters)
                            bmi = String(format: "%.2f", bmiValue)
                            showResult = true
                        } else {
                            bmi = "Invalid input"
                            showResult = false
                        }
                    }) {
                        Text("Calculate")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
                )
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showResult) {
            if let bmiDouble = Double(bmi) {
                BMIResultView(bmi: bmiDouble)
                    .presentationDetents([.medium, .large])
            } else {
                Text("Invalid BMI value")
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    ContentView()
}
