//
//  ViewController.swift
//  Card Matching Game
//
//  Created by 張睿恩 on 2025/3/4.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cards: [UIButton]!

    lazy var game: MatchingGame = MatchingGame(
        numberOfPairsOfCards: (cards.count) / 2)

    var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }

    let emojiChoices = ["👻", "🎃", "👽", "🐤", "👻", "🎃", "👽", "🐤"]
    var randomIndexToReal: [Int] = []

    func randomIndex() {
        let font = UIFont.systemFont(ofSize: 50)
        let attributes = [NSAttributedString.Key.font: font]

        self.randomIndexToReal = Array(0..<emojiChoices.count).shuffled()
        for card in cards {
            let message = NSAttributedString(
                string: "", attributes: attributes)
            card.setAttributedTitle(message, for: UIControl.State.normal)
            let frontcolor = #colorLiteral(
                red: 0.8049729466, green: 0.5912739038, blue: 0.7204996347,
                alpha: 1)
            card.backgroundColor = frontcolor
        }
    }
    @IBAction func resetCard(_ sender: Any) {
        randomIndex()
    }

    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: UIColor.black,
        ]
        let attributedString = NSAttributedString(
            string: "Flips:\(flipCount)", attributes: attributes)
        fliplabel.attributedText = attributedString
    }

    @IBOutlet weak var fliplabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomIndex()
    }

    @IBAction func flipCard(_ sender: UIButton) {
        let font = UIFont.systemFont(ofSize: 50)
        let attributes = [NSAttributedString.Key.font: font]

        var title = ""
        //        if let tit = sender.titleLabel!.text {
        //            title = tit
        //        }
        if let id = cards.firstIndex(of: sender) {
            print(id)
            title = emojiChoices[self.randomIndexToReal[id]]
        }

        if sender.currentAttributedTitle!.string == title {
            let message = NSAttributedString(string: "", attributes: attributes)
            sender.setAttributedTitle(message, for: UIControl.State.normal)
            let frontcolor = #colorLiteral(
                red: 0.8049729466, green: 0.5912739038, blue: 0.7204996347,
                alpha: 1)
            sender.backgroundColor = frontcolor
        } else {
            let message = NSAttributedString(
                string: title, attributes: attributes)
            sender.setAttributedTitle(message, for: UIControl.State.normal)
            let bgcolor = #colorLiteral(
                red: 1, green: 0.968627451, blue: 0.9529411765, alpha: 1)
            sender.backgroundColor = bgcolor
        }
        flipCount += 1
    }
}
