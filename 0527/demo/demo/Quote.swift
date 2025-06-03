//
//  Quote.swift
//  demo
//
//  Created by 張睿恩 on 2025/5/27.
//

import SwiftData

@Model
final class Quote {
    var text: String
    var book: String

    init(text: String, book: String) {
        self.text = text
        self.book = book
    }

    static let sampleData = [
        Quote(
            text: "如果你馴養了我,我們就彼此需要了",
            book: "小王子"
        ),
        Quote(
            text: "Dreams do come true, if only we wish hard enough.",
            book: "彼得潘"
        ),
    ]
}
