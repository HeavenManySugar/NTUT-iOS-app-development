//
//  BookDetail.swift
//  0506
//
//  Created by 張睿恩 on 2025/5/6.
//

import SwiftUI

struct BookDetail: View {
    let book: Book

    var body: some View {
        ScrollView {
            VStack {
                Text(book.name)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.primary)
                Text(book.author)
                    .font(.body)
                    .foregroundStyle(.secondary)
                Image(book.coverImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .shadow(color: .primary, radius: 10)
                Text(book.description)
                    .font(.body)
                    .lineSpacing(5)
            }
        }
        .contentMargins(.horizontal, 20)
    }
}

#Preview {
    let book = Book(
        name: "The Swift Programming Language",
        author: "Apple Inc.",
        coverImage: "swift",
        description:
            "The Swift Programming Language is Apple's comprehensive guide to writing Swift code."
    )
    BookDetail(book: book)
}
