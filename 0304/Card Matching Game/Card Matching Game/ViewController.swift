//
//  ViewController.swift
//  Card Matching Game
//
//  Created by 張睿恩 on 2025/3/4.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0 {
        didSet{
            fliplabel.text = "Flip Count: \(flipCount)"
        }
    }
    var buttonEmojiMap = [UIButton: String]()
    @IBOutlet weak var fliplabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func flipCard(_ sender: UIButton) {
        if let emoji = buttonEmojiMap[sender] {
            _flipCard(withEmoji: emoji, on: sender)
        } else {
            let emoji = sender.currentTitle
            buttonEmojiMap[sender] = emoji
            _flipCard(withEmoji: emoji!, on: sender)
        }
        flipCount += 1
    }
    func _flipCard(withEmoji emoji:String, on button:UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.8980392157, blue: 0.8352941176, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.8509803922, blue: 0.8666666667, alpha: 1)
        }
    }

}

