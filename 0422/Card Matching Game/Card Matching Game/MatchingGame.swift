//
//  MatchingGame.swift
//  Card Matching Game
//
//  Created by 張睿恩 on 2025/4/1.
//

import Foundation

class MatchingGame {
    var cards: [Card] = []
    var indexOfOneAndOnlyFaceUpCard: Int?
    {
        get {
            var foundIndex: Int?
            for index in cards.indices where (cards[index].isFaceUp && !cards[index].isMatched) {
                if foundIndex == nil {
                    foundIndex = index
                } else {
                    return nil
                }
            }
            return foundIndex
        }
        set {
            for i in cards.indices {
                cards[i].isFaceUp = (i == newValue || cards[i].isMatched)
            }
        }
    }
    
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
            } else {
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
