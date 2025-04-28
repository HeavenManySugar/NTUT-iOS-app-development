//
//  OneCardViewController.swift
//  midterm
//
//  Created by 張睿恩 on 2025/4/24.
//

import UIKit

class OneCardViewController: UIViewController {
    let randomCardEngine = randomCard()
    var currentCards: [UIImageView: Card] = [:]

    @IBOutlet weak var AIBtn: UIButton!
    @IBOutlet weak var topic: UISegmentedControl!
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var cardImage: UIImageView! {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            cardImage.addGestureRecognizer(tapGestureRecognizer)
            cardImage.isUserInteractionEnabled = true
            }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        // Your action
        if tappedImage.image == UIImage(named: "CardBack") {
            AIBtn.isEnabled = true
            let card = currentCards[tappedImage]!
            tappedImage.image = UIImage(named: card.name)
            if card.reversed{
                tappedImage.transform = CGAffineTransform(scaleX: 1, y: -1)
            } else {
                tappedImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        } else {
            AIBtn.isEnabled = false
            tappedImage.image = UIImage(named: "CardBack")
            tappedImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AIBtn.isEnabled = false
        reset(self)
    }
    
    @IBAction func askAI(_ sender: Any) {
        performSegue(withIdentifier: "showChat", sender: promptMaker(spread_type: "single_card", cards: Array(currentCards.values), question_focus: topic.titleForSegment(at: topic.selectedSegmentIndex)!, specific_question: question.text!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChat",
           let controller = segue.destination as? ShowChatViewController,
           let prompt = sender as? String {
            controller.prompt = prompt
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        randomCardEngine.reset()
        let card = randomCardEngine.getRandomCard()
        currentCards[cardImage] = card
        cardImage.image = UIImage(named: "CardBack")
        AIBtn.isEnabled = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
