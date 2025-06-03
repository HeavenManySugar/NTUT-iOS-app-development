//
//  ContentView.swift
//  HW10
//
//  Created by 張睿恩 on 2025/5/27.
//

import SwiftUI

// MARK: - Gemini API Data Structures

struct GeminiRequest: Codable {
    let contents: [RequestContent]
}

struct RequestContent: Codable {
    let parts: [Part]
}

struct Part: Codable {
    let text: String
}

struct GeminiResponse: Codable {
    let candidates: [Candidate]?
    let error: GeminiErrorDetail? // To capture API errors
}

struct Candidate: Codable {
    let content: ResponseContent
    // Add other fields like finishReason, safetyRatings if needed
}

struct ResponseContent: Codable {
    let parts: [Part]
    let role: String? // Role is usually "model"
}

struct GeminiErrorDetail: Codable {
    let code: Int
    let message: String
    let status: String
}

struct ContentView: View {
    private let apiKey = "YOUR_API_KEY" // Replace with your actual Gemini API key
    private let apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent"

    @State private var promptText: String = ""
    @State private var responseText: String = ""
    @State private var isLoading: Bool = false
    @State private var errorMessage: String? = nil
    @State private var isTyping: Bool = false
    @State private var showResponse: Bool = false
    
    private let gradientColors = [
        Color(red: 0.776, green: 0.6, blue: 0.714), // #c599b6 (紫色)
        Color(red: 0.902, green: 0.698, blue: 0.729), // #e6b2ba (粉紅色)
        Color(red: 0.98, green: 0.816, blue: 0.769), // #fad0c4 (淡粉色)
        Color(red: 1.0, green: 0.969, blue: 0.953), // #fff7f3 (淺白色)
    ]

    var body: some View {
        NavigationView {
            ZStack {
                // 背景漸層
                LinearGradient(gradient: Gradient(colors: gradientColors),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // 標題區
                        Text("Gemini AI")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(Color(red: 0.4, green: 0.2, blue: 0.4))
                            .padding(.top, 20)
                        
                        Text("聊天助手")
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(Color(red: 0.4, green: 0.2, blue: 0.4))
                            .padding(.bottom, 10)
                        
                        // 輸入區塊
                        VStack(alignment: .leading, spacing: 10) {
                            Text("你的問題")
                                .font(.headline)
                                .padding(.leading, 5)
                                .foregroundColor(Color(red: 0.4, green: 0.2, blue: 0.4))
                            
                            TextEditor(text: $promptText)
                                .frame(minHeight: 120)
                                .padding()
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color(red: 0.776, green: 0.6, blue: 0.714), lineWidth: 1)
                                )
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                                .onChange(of: promptText) { _ in
                                    withAnimation {
                                        isTyping = true
                                    }
                                }
                                .accessibilityLabel("輸入你的問題")
                        }
                        .padding(.horizontal)
                        
                        // 按鈕區
                        Button(action: {
                            Task {
                                withAnimation(.spring()) {
                                    isTyping = false
                                }
                                await callGeminiAPI()
                                withAnimation(.easeIn(duration: 0.5)) {
                                    showResponse = true
                                }
                            }
                        }) {
                            HStack {
                                Image(systemName: "sparkles")
                                Text("生成回答")
                                if isLoading {
                                    ProgressView()
                                        .padding(.leading, 5)
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                }
                            }
                            .frame(minWidth: 200, minHeight: 50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [
                                    Color(red: 0.776, green: 0.6, blue: 0.714),
                                    Color(red: 0.902, green: 0.698, blue: 0.729)
                                ]), startPoint: .leading, endPoint: .trailing)
                            )
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(25)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                            .scaleEffect(isTyping ? 1.05 : 1.0)
                            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isTyping)
                        }
                        .disabled(isLoading || promptText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        .padding(.vertical)
                        
                        // 錯誤訊息
                        if let errorMessage = errorMessage {
                            Text("錯誤：\(errorMessage)")
                                .foregroundColor(.red)
                                .font(.system(size: 14))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.red.opacity(0.1))
                                )
                                .padding(.horizontal)
                                .transition(.scale.combined(with: .opacity))
                        }
                        
                        // 回答區
                        if !responseText.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("AI 回答")
                                    .font(.headline)
                                    .padding(.leading, 5)
                                    .foregroundColor(Color(red: 0.4, green: 0.2, blue: 0.4))
                                    .opacity(showResponse ? 1 : 0)
                                    .animation(.easeInOut(duration: 0.5).delay(0.2), value: showResponse)
                                
                                Text(responseText)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                                    .opacity(showResponse ? 1 : 0)
                                    .animation(.easeInOut(duration: 0.7).delay(0.3), value: showResponse)
                                    .accessibilityLabel("AI 回答")
                            }
                            .padding(.horizontal)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "sparkles.rectangle.stack")
                            .foregroundColor(Color(red: 0.776, green: 0.6, blue: 0.714))
                        Text("Gemini AI 助手")
                            .font(.headline)
                            .foregroundColor(Color(red: 0.4, green: 0.2, blue: 0.4))
                    }
                }
            }
        }
    }

    private func callGeminiAPI() async {
        guard !apiKey.starts(with: "YOUR_API_KEY") else {
            self.errorMessage = "Please replace 'YOUR_API_KEY' with your actual Gemini API key."
            self.responseText = ""
            return
        }
        
        guard let url = URL(string: "\(apiUrl)?key=\(apiKey)") else {
            self.errorMessage = "Invalid API URL"
            self.responseText = ""
            return
        }

        isLoading = true
        errorMessage = nil
        responseText = ""

        let requestBody = GeminiRequest(contents: [RequestContent(parts: [Part(text: promptText)])])

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(requestBody)

            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                self.errorMessage = "Invalid response from server."
                self.isLoading = false
                return
            }
            
            let decoder = JSONDecoder()
            let geminiResponse = try decoder.decode(GeminiResponse.self, from: data)

            if let errorDetail = geminiResponse.error {
                self.errorMessage = "API Error: \(errorDetail.message) (Status: \(errorDetail.status), Code: \(errorDetail.code))"
                self.responseText = ""
            } else if let text = geminiResponse.candidates?.first?.content.parts.first?.text {
                self.responseText = text
                self.errorMessage = nil
            } else if httpResponse.statusCode != 200 {
                 self.errorMessage = "Server error: HTTP \(httpResponse.statusCode). Response: \(String(data: data, encoding: .utf8) ?? "No details")"
                 self.responseText = ""
            }
            else {
                self.errorMessage = "No response text found or unexpected format."
                self.responseText = ""
            }

        } catch let encodingError as EncodingError {
            self.errorMessage = "Failed to encode request: \(encodingError.localizedDescription)"
            self.responseText = ""
        } catch let decodingError as DecodingError {
            self.errorMessage = "Failed to decode response: \(decodingError.localizedDescription)"
            self.responseText = ""
        } catch {
            self.errorMessage = "An unexpected error occurred: \(error.localizedDescription)"
            self.responseText = ""
        }

        isLoading = false
    }
}

#Preview {
    ContentView()
}
