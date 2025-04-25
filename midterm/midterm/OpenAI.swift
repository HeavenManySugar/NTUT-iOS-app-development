//
//  OpenAI.swift
//  midterm
//
//  Created by 張睿恩 on 2025/4/24.
//

import Foundation
import UIKit
import CDMarkdownKit

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

struct Request: Codable {
    let includeCardMeaning: Bool
    let includeEmotionalAspects: Bool
    let includeActionAdvice: Bool
    let reflectionQuestions: Bool
    let detailLevel: String
    let language: String
    
    enum CodingKeys: String, CodingKey {
        case includeCardMeaning = "include_card_meaning"
        case includeEmotionalAspects = "include_emotional_aspects"
        case includeActionAdvice = "include_action_advice"
        case reflectionQuestions = "reflection_questions"
        case detailLevel = "detail_level"
        case language = "language"
    }
}

struct TarotReading: Codable {
    let reading: Reading
    let request: Request
}

func streamOpenAIResponse(prompt: String, textView: UITextView) async {
    guard !prompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        print("錯誤：prompt 為空，請確認是否正確產生。")
        return
    }
    DispatchQueue.main.async {
        textView.text = ""
    }
    print(prompt)
    guard let url = URL(string: "https://openrouter.ai/api/v1/chat/completions") else { return }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("Bearer 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", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let requestBody: [String: Any] = [
        "model": "deepseek/deepseek-chat-v3-0324:free",
        "messages": [
            ["role": "user", "content": prompt]
        ],
        "stream": true
    ]

    request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)

    var text = ""
    
    do {
        let (bytes, _) = try await URLSession.shared.bytes(for: request)
        for try await line in bytes.lines {
            if line.hasPrefix("data: ") {
                let jsonString = line.replacingOccurrences(of: "data: ", with: "")
                if jsonString == "[DONE]" { break }

                if let jsonData = jsonString.data(using: .utf8),
                   let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
                   let choices = json["choices"] as? [[String: Any]],
                   let delta = choices.first?["delta"] as? [String: Any],
                   let content = delta["content"] as? String {
                    print(content)
                    DispatchQueue.main.async {
                        text += content
                        let parser = CDMarkdownParser()
                        let attributedString = parser.parse(text)
                        textView.attributedText = attributedString
                    }
                }
            }
        }
    } catch {
        print("串流過程中發生錯誤：\(error)")
    }
}

func promptMaker(spread_type: String, cards: [Card], question_focus: String, specific_question: String?) -> String {
    let json = TarotReading(
        reading: Reading(
            spreadType: spread_type,
            card: cards,
            questionFocus: question_focus,
            specificQuestion: specific_question ?? "",
        ),
        request: Request(
            includeCardMeaning: true,
            includeEmotionalAspects: true,
            includeActionAdvice: true,
            reflectionQuestions: true,
            detailLevel: "summary",
            language: "繁體中文(臺灣)"
        )
    )
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    if let jsonData = try? encoder.encode(json),
       let jsonString = String(data: jsonData, encoding: .utf8) {
        return """
**指令：**

請扮演一位專業、溫暖且富有同情心的真人塔羅解讀師。

根據以下提供的塔羅解讀資訊，為提問者進行解讀。請在提供深入、專業且包含所有必要元素（牌義、情緒、建議、反思）的同時，**特別注意用詞的精煉與表達的效率**。目標是在不犧牲回應的品質、溫度與「真人感」的前提下，**盡可能地減少不必要的字句，以節省tokens**。

請確保解讀語氣真誠、溫暖，精準地將牌義應用於提問者「目前感情關係中應注意的能量」這個特定問題上。使用繁體中文。

**塔羅解讀資訊：**
""" + jsonString
    }
    return ""
}
