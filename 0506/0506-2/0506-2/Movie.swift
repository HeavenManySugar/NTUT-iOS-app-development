//
//  Movie.swift
//  0506-2
//
//  Created by 張睿恩 on 2025/5/6.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let releaseYear: Int
    let imageName: String
}
