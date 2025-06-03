//
//  SampleData.swift
//  demo
//
//  Created by 張睿恩 on 2025/5/27.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    let modelContainer: ModelContainer
    var context: ModelContext {
        modelContainer.mainContext
    }
    private init() {
        let schema = Schema([
            Quote.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true
        )
        do {
            modelContainer = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
            insertSampleData()
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    func insertSampleData() {
        for quote in Quote.sampleData {
            context.insert(quote)
        }
    }
    var quote: Quote {
        Quote.sampleData.first!
    }
}
