//
//  demoApp.swift
//  demo
//
//  Created by 張睿恩 on 2025/5/27.
//

import SwiftUI
import SwiftData

@main
struct demoApp: App {
    var body: some Scene {
        WindowGroup {
            QuoteList()
        }
        .modelContainer(for: Quote.self)
    }
}
