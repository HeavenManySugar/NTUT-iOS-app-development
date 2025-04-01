//
//  Card.swift
//  Card Matching Game
//	
//  Created by 張睿恩 on 2025/4/1.
//

import Foundation

struct Card {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var identifier: Int
    static var identifierFactory: Int = 0

    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

    //    init (identifier i: Int) {
    //        self.identifier = i
    //    }
}
