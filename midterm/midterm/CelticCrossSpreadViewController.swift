//
//  CelticCrossSpreadViewController.swift
//  midterm
//
//  Created by 張睿恩 on 2025/4/25.
//

import UIKit

class CelticCrossSpreadViewController: UIViewController {
    let randomCardEngine = randomCard()
    var currentCards: [UIImageView: Card] = [:]

    @IBOutlet weak var AIBtn: UIButton!
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var topic: UISegmentedControl!
    @IBOutlet var cardImageViews: [UIImageView]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for (index, imageView) in cardImageViews.enumerated() {
            imageView.isUserInteractionEnabled = true // 確保可以點擊
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cardTapped(_:)))
            tapGesture.view?.tag = index
            imageView.addGestureRecognizer(tapGesture)
        }
        
        AIBtn.isEnabled = false
        reset(self)
    }
    
    @objc func cardTapped(_ sender: UITapGestureRecognizer) {
        if let tappedImage = sender.view as? UIImageView {
            if tappedImage.image == UIImage(named: "CardBack") {
                let card = currentCards[tappedImage]!
                tappedImage.image = UIImage(named: card.name)
                if card.reversed{
                    tappedImage.transform = tappedImage.transform.scaledBy(x: 1, y: -1)
                }
            } else {
                AIBtn.isEnabled = false
                tappedImage.image = UIImage(named: "CardBack")
                if currentCards[tappedImage]!.reversed{
                    tappedImage.transform = tappedImage.transform.scaledBy(x: 1, y: -1)
                }
            }
        }
        for (_, imageView) in cardImageViews.enumerated() {
            if imageView.image == UIImage(named: "CardBack") {
                return
            }
        }
        AIBtn.isEnabled = true
    }

    @IBAction func reset(_ sender: Any) {
        randomCardEngine.reset()
        for (_, imageView) in cardImageViews.enumerated() {
            let card = randomCardEngine.getRandomCard()
            currentCards[imageView] = card
            imageView.image = UIImage(named: "CardBack")
        }
        AIBtn.isEnabled = false
    }
    @IBAction func askAI(_ sender: Any) {
        let prompt = promptMaker(spread_type: "CelticCrossSpread", cards: Array(currentCards.values), question_focus: topic.titleForSegment(at: topic.selectedSegmentIndex)!, specific_question: question.text!)
        print(prompt)
        performSegue(withIdentifier: "showChat", sender: prompt)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChat",
           let controller = segue.destination as? ShowChatViewController,
           let prompt = sender as? String {
            controller.prompt = prompt
        }
    }

}
