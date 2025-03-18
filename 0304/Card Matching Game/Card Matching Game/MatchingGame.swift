//
//  MatchingGame.swift
//  Card Matching Game
//
//  Created by 張睿恩 on 2025/3/18.
//

import Foundation

class MatchingGame {
    var cards: [Card] = []
    func chooseCard(at index: Int) {
        return
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
}
