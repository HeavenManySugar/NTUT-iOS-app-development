//
//  OpenAIHelper.swift
//  midterm
//
//  Created by 張睿恩 on 2025/4/24.
//

import Foundation
import UIKit
import CDMarkdownKit
import SwiftOpenAI

struct Reading: Codable {
    let spreadType: String
    let card: [Card]
    let questionFocus: String
    let specificQuestion: String
    
    enum CodingKeys: String, CodingKey {
        case spreadType = "spread_type"
        case card
        case questionFocus = "question_focus"
        case specificQuestion = "specific_question"
    }
}

struct Card: Codable {
    let name: String
    let reversed: Bool
}

struct OutputStyle: Codable {
    let tone: String
    let length: String
    let structure: String
    
    enum CodingKeys: String, CodingKey {
        case tone = "tone"
        case length = "length"
        case structure = "structure"
    }
}

struct Request: Codable {
    let language: String
    let outputStyle: OutputStyle?
    
    enum CodingKeys: String, CodingKey {
        case language = "language"
        case outputStyle = "output_style"
    }
}

struct Extra: Codable {
    let actionAdvice: Bool?
    let mythologicalReferences: Bool?
    let visualSymbolism: Bool?
    
    enum CodingKeys: String, CodingKey {
        case actionAdvice = "action_advice"
        case mythologicalReferences = "mythological_references"
        case visualSymbolism = "visual_symbolism"
    }
}

struct TarotReading: Codable {
    let reading: Reading
    let request: Request
    let extra: Extra
}

func streamOpenAIResponse(prompt: String, textView: UITextView, retryCount: Int = 3) async {
    print(prompt)
    guard !prompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        print("錯誤：prompt 為空，請確認是否正確產生。")
        return
    }

    DispatchQueue.main.async {
        textView.text = "🔮 正在塔羅解讀中，請稍候..."
    }

    let apiKey = "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"
    let service = OpenAIServiceFactory.service(apiKey: apiKey,
       overrideBaseURL: "https://openrouter.ai",
       proxyPath: "api",
    )
    
    var systemPrompt = """
請扮演一位專業、溫暖且富有同情心的真人塔羅解讀師。
根據以下提供的塔羅解讀資訊，為提問者進行解讀。請在提供深入、專業且包含所有必要元素（牌義、情緒、建議、反思）的同時，**特別注意用詞的精煉與表達的效率**。目標是在不犧牲回應的品質、溫度與「真人感」的前提下，**盡可能地減少不必要的字句，以節省tokens**。**回答請以markdown語法回答** 請在最開始的時候，說明抽到的牌的名稱。使用繁體中文。
"""

    if prompt.contains("CelticCrossSpread") {
        systemPrompt += """
對於CelticCrossSpread每張牌的定義為
1. 現況 : 表示問卜者所看到的狀況
2.  影響因素 : 表示加在現況上的阻力或助力  (正面的牌為助力，負面的牌為阻力)
3.  理想 : 表示問卜者覺得最理想的狀況，或是對於事情的想法
4.  基礎 : 表示目前問卜者已累積的成果或可以利用的資源
5.  過去 : 表示問卜者過去的發生的事情
6.  未來 : 表示問卜者未來會發生的事情
7.  自我 : 表示一到六號牌綜合起來的狀況
8.  環境 : 表示外在環境因素或他人的觀點
9.  希望或恐懼 : 表示問卜者希望發生或害怕發生的事情 (正面的牌為希望發生，負面的牌為害怕發生)
10.  結果 : 事情最後的結果
"""
    }
    let parameters = ChatCompletionParameters(messages: [.init(
        role: .system,
        content: .text(systemPrompt)), .init(
        role: .user,
        content: .text(prompt))
    ], model: .custom("deepseek/deepseek-chat-v3-0324:free"))

    do {
        
        let stream = try await service.startStreamedChat(parameters: parameters)
        
        var text = ""
        
        for try await result in stream {
            let content = (result.choices?.first?.delta?.content)!
            print(content)
            DispatchQueue.main.async {
                text += content
                let parser = CDMarkdownParser()
                let attributedString = parser.parse(text)
                textView.attributedText = attributedString
            }
        }
        
    } catch APIError.responseUnsuccessful(let description, let statusCode) {
        DispatchQueue.main.async {
            textView.text = "⚠️ Network error with status code: \(statusCode) and description: \(description)"
        }

    } catch {
        DispatchQueue.main.async {
            textView.text = "⚠️ \(error.localizedDescription)"
        }

    }
}
func promptMaker(spread_type: String, cards: [Card], question_focus: String, specific_question: String) -> String {
    let json = TarotReading(
        reading: Reading(
            spreadType: spread_type,
            card: cards,
            questionFocus: question_focus,
            specificQuestion: specific_question.isEmpty ? "這張牌對於\(question_focus)有什麼理解?" : specific_question,
        ),
        request: Request(
            language: "繁體中文(臺灣)",
            outputStyle: OutputStyle(
                tone: "親切但專業",  // 可選：溫暖/嚴謹/靈性
                length: "medium",    // 可選：short/medium/detailed
                structure: "分點說明" // 可選：自由敘述/表格/分點
                    
            )
        ),
        extra: Extra(
            actionAdvice: true,
            mythologicalReferences: true,
            visualSymbolism: true,
        )
    )
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    if let jsonData = try? encoder.encode(json),
       let jsonString = String(data: jsonData, encoding: .utf8) {
        return jsonString
    }
    return ""
}
