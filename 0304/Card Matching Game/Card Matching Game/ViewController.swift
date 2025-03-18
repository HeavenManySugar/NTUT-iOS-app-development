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
    }

    @IBAction func flipCard(_ sender: UIButton) {

        let font = UIFont.systemFont(ofSize: 44)
        let attributes = [NSAttributedString.Key.font: font]

        var title = ""
        //        if let tit = sender.titleLabel!.text {
        //            title = tit
        //        }
        if let id = cards.firstIndex(of: sender) {
            print(id)
            title = emojiChoices[id]
        }

        if sender.currentAttributedTitle == nil {
            let message = NSAttributedString(
                string: title, attributes: attributes)
            sender.setAttributedTitle(message, for: UIControl.State.normal)
        }

        if sender.currentAttributedTitle!.string == title {
            let message = NSAttributedString(string: "", attributes: attributes)
            sender.setAttributedTitle(message, for: UIControl.State.normal)
            let frontcolor = UIColor(
                red: 0.4621, green: 0.5676, blue: 0.5747, alpha: 1)
            sender.backgroundColor = frontcolor
        } else {
            let message = NSAttributedString(
                string: title, attributes: attributes)
            sender.setAttributedTitle(message, for: UIControl.State.normal)
            let bgcolor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            sender.backgroundColor = bgcolor
        }
        flipCount += 1
    }
}
