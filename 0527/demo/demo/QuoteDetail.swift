//
//  QuoteDetail.swift
//  demo
//
//  Created by 張睿恩 on 2025/5/27.
//

import SwiftData
import SwiftUI

struct QuoteDetail: View {
    @Bindable var quote: Quote
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    let isNew: Bool

    init(quote: Quote, isNew: Bool = false) {
        self.quote = quote
        self.isNew = isNew
    }

    var body: some View {
        Form {
            TextField("text", text: $quote.text, axis: .vertical)
            TextField("book", text: $quote.book)
        }
        .navigationTitle(isNew ? "New Quote" : "Quote")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(quote)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        QuoteDetail(quote: SampleData.shared.quote)
    }
}
