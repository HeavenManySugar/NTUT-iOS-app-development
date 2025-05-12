//
//  Author.swift
//  0506
//
//  Created by 張睿恩 on 2025/5/6.
//

import Foundation

struct Author: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let books: [Book]
}
