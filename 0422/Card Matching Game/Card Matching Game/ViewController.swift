//
//  ViewController.swift
//  Card Matching Game
//
//  Created by 張睿恩 on 2025/4/1.
//

import UIKit

extension Int{
    var arc4random:Int {
        if self > 0 {
            return Int (arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int (arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet var cards: [UIButton]!

    lazy var game: MatchingGame = MatchingGame(
        numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards:Int {
        return cards.count / 2
    }

    var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    var flipAllCardFlag:Bool = false
    let emojiChoicesConst = ["👻", "🎃", "👽", "🐤", "😂", "😉", "😋", "😎"]
    lazy var emojiChoices = emojiChoicesConst
    var emoji = [Card: String]()

    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: UIColor.orange,
        ]
        let attributedString = NSAttributedString(
            string: "Flips:\(flipCount)", attributes: attributes)
        fliplabel.attributedText = attributedString
    }

    @IBOutlet weak var fliplabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViewFromModel()
        updateFlipCountLabel()
    }

    @IBAction func flipCard(_ sender: UIButton) {
        if flipAllCardFlag {
            return
        }
        if let cardNumber = cards.firstIndex(of: sender) {
            if !game.cards[cardNumber].isMatched {
                flipCount += 1
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
                    string: "", attributes: attributes)
                if button.attributedTitle(for: UIControl.State.normal) != message {
                    UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
                button.setAttributedTitle(message, for: UIControl.State.normal)
                let frontcolor = #colorLiteral(
                    red: 0.8049729466, green: 0.5912739038, blue: 0.7204996347,
                    alpha: 1)
                button.backgroundColor = frontcolor
            } else {
                let message = NSAttributedString(
                    string: getEmoji(for: card), attributes: attributes)
                if button.attributedTitle(for: UIControl.State.normal) != message {
                    UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
                button.setAttributedTitle(message, for: UIControl.State.normal)
                let bgcolor = #colorLiteral(
                    red: 1, green: 0.968627451, blue: 0.9529411765, alpha: 1)
                button.backgroundColor = bgcolor
            }
            if card.isMatched {
                button.backgroundColor = button.backgroundColor?.withAlphaComponent(0.5)
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        emoji = [Card: String]()
        emojiChoices = emojiChoicesConst
        game = MatchingGame(
            numberOfPairsOfCards: (cards.count) / 2)
        flipCount = 0
        updateViewFromModel()
        flipAllCardFlag = false
    }
    
    @IBAction func flipAllCards(_ sender: Any) {
        flipAllCardFlag = !flipAllCardFlag
        for index in game.cards.indices {
            game.cards[index].isFaceUp = flipAllCardFlag
            game.cards[index].isMatched = false
        }
        flipCount = 0
        updateViewFromModel()
    }
    
    func getEmoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
}
