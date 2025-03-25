//
//  MatchingGame.swift
//  Card Matching Game
//
//  Created by 張睿恩 on 2025/3/18.
//

import Foundation

class MatchingGame {
    var cards: [Card] = []
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard {
                if matchIndex != index {
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for i in cards.indices {
                    if cards[i].isMatched { continue }
                    cards[i].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle()
    }
}
