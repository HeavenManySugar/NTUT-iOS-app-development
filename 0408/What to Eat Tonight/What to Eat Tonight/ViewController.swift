//
//  ViewController.swift
//  What to Eat Tonight
//
//  Created by 張睿恩 on 2025/4/1.
//

import UIKit

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet var cards: [UIButton]!
    @IBOutlet var foodCards: [UIButton]!
    @IBOutlet var drinkCards: [UIButton]!

    lazy var game: MatchingGame = MatchingGame(
        numberOfPairsOfCards: numberOfPairsOfCards
    )

    private var numberOfPairsOfCards: Int {
        return cards.count / 2
    }

    var flipAllCardFlag: Bool = false
    let foodEmojiChoicesConst = ["🍎", "🍕", "🍔", "🍣", "🍰", "🥗", "🍟", "🍩", "🍇", "🍍", "🍌", "🌮", "🍝", "🍖", "🥨", "🥒"]
    let drinkEmojiChoicesConst = ["☕️", "🍵", "🥤", "🧃", "🍺", "🍷", "🧋", "🥛", "🍹", "🍸", "🥂", "🍾", "🍻"]
    lazy var foodEmojiChoices = foodEmojiChoicesConst
    lazy var drinkEmojiChoices = drinkEmojiChoicesConst
    var emoji = [Int: String]()

    @IBOutlet weak var fliplabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViewFromModel()
    }

    @IBAction func flipCard(_ sender: UIButton) {
        if flipAllCardFlag {
            return
        }
        if let cardNumber = cards.firstIndex(of: sender) {
            if game.cards[cardNumber].isFaceUp {
                let tmpEmoji = emoji[cardNumber]!
                if cardNumber < 8 {
                    emoji[cardNumber] = foodEmojiChoices.remove(
                        at: foodEmojiChoices.count.arc4random
                    )
                    foodEmojiChoices.append(tmpEmoji)

                } else {
                    emoji[cardNumber] = drinkEmojiChoices.remove(
                        at: drinkEmojiChoices.count.arc4random
                    )
                    drinkEmojiChoices.append(tmpEmoji)
                }
            }
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card not found")
        }
    }

    func updateViewFromModel() {
        let font = UIFont.systemFont(ofSize: 44)
        let attributes = [NSAttributedString.Key.font: font]

        for index in cards.indices {
            let card = game.cards[index]
            let button = cards[index]

            if !card.isFaceUp {
                let message = NSAttributedString(
                    string: "",
                    attributes: attributes
                )
                if button.attributedTitle(for: UIControl.State.normal)
                    != message
                {
                    UIView.transition(
                        with: button,
                        duration: 0.3,
                        options: .transitionFlipFromLeft,
                        animations: nil,
                        completion: nil
                    )
                }
                button.setAttributedTitle(message, for: UIControl.State.normal)
                if index < 8 {
                    let frontcolor = #colorLiteral(
                        red: 0.8049729466,
                        green: 0.5912739038,
                        blue: 0.7204996347,
                        alpha: 1
                    )
                    button.backgroundColor = frontcolor
                }
                // For the next 8 cards
                else {
                    let frontcolor = #colorLiteral(
                        red: 0.6,
                        green: 0.8,
                        blue: 0.6,
                        alpha: 1
                    )  // Example different color
                    button.backgroundColor = frontcolor
                }
            } else {
                let message = NSAttributedString(
                    string: getEmoji(for: index),
                    attributes: attributes
                )
                if button.attributedTitle(for: UIControl.State.normal)
                    != message
                {
                    UIView.transition(
                        with: button,
                        duration: 0.3,
                        options: .transitionFlipFromLeft,
                        animations: nil,
                        completion: nil
                    )
                }
                button.setAttributedTitle(message, for: UIControl.State.normal)
                // For first 8 cards
                if index < 8 {
                    let bgcolor = #colorLiteral(
                        red: 1,
                        green: 0.968627451,
                        blue: 0.9529411765,
                        alpha: 1
                    )
                    button.backgroundColor = bgcolor
                }
                // For the next 8 cards
                else {
                    let bgcolor = #colorLiteral(
                        red: 0.8,
                        green: 0.9,
                        blue: 0.9,
                        alpha: 1
                    )  // Example different color
                    button.backgroundColor = bgcolor
                }

            }
            if card.isMatched {
                button.backgroundColor = button.backgroundColor?
                    .withAlphaComponent(0.5)
            }
        }
    }

    @IBAction func reset(_ sender: Any) {
        emoji = [Int: String]()
        foodEmojiChoices = foodEmojiChoicesConst
        drinkEmojiChoices = drinkEmojiChoicesConst
        game = MatchingGame(
            numberOfPairsOfCards: (cards.count) / 2
        )
        updateViewFromModel()
        flipAllCardFlag = false
    }

    @IBAction func flipAllCards(_ sender: Any) {
        flipAllCardFlag = !flipAllCardFlag
        for index in game.cards.indices {
            game.cards[index].isFaceUp = flipAllCardFlag
            game.cards[index].isMatched = false
        }
        updateViewFromModel()
    }

    func getEmoji(for index: Int) -> String {
        if emoji[index] == nil {
            if index < 8 {
                emoji[index] = foodEmojiChoices.remove(
                    at: foodEmojiChoices.count.arc4random
                )

            } else {
                emoji[index] = drinkEmojiChoices.remove(
                    at: drinkEmojiChoices.count.arc4random
                )
            }
        }
        return emoji[index] ?? "?"
    }
}
