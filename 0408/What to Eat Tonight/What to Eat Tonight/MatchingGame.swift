//
//  MatchingGame.swift
//  What to Eat Tonight
//
//  Created by 張睿恩 on 2025/4/1.
//

import Foundation

class MatchingGame {
    var cards: [Card] = []
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            cards[index].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
//        cards.shuffle()
    }
}
