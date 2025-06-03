//
//  QuoteList.swift
//  demo
//
//  Created by 張睿恩 on 2025/5/27.
//

import SwiftData
import SwiftUI

struct QuoteList: View {
    @Query private var quotes: [Quote]
    @Environment(\.modelContext) private var context
    @State private var newQuote: Quote?

    var body: some View {
        NavigationStack {
            List {
                ForEach(quotes) { quote in
                    NavigationLink(quote.text) {
                        QuoteDetail(quote: quote)
                    }
                }
                .onDelete(perform: deleteQuotes(indexes:))
            }
            .navigationTitle("Quotes")
            .toolbar {
                ToolbarItem {
                    Button(
                        "Add Quote",
                        systemImage: "plus",
                        action: addQuote
                    )
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(item: $newQuote) { quote in
                NavigationStack {
                    QuoteDetail(quote: quote, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        }
    }

    private func addQuote() {
        let newItem = Quote(text: "", book: "")
        context.insert(newItem)
        newQuote = newItem
    }

    private func deleteQuotes(indexes: IndexSet) {
        for index in indexes {
            context.delete(quotes[index])
        }
    }
}

#Preview {
    NavigationStack {
        QuoteList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}
