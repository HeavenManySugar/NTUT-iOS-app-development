//
//  ContentView.swift
//  0506
//
//  Created by 張睿恩 on 2025/5/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let book = Book(
            name: "The Swift Programming Language",
            author: "Apple Inc.",
            coverImage: "swift",
            description:
                "The Swift Programming Language is Apple's comprehensive guide to writing Swift code."
        )
        BookDetail(book: book)
    }
}

#Preview {
    ContentView()
}
