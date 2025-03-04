//
//  ViewController.swift
//  Card Matching Game
//
//  Created by 張睿恩 on 2025/3/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func flipCard(_ sender: UIButton) {
        let colorA = UIColor(displayP3Red: 199/255, green: 217/255, blue: 221/255, alpha: 1.0)
        let colorB = UIColor(displayP3Red: 213/255, green: 229/255, blue: 213/255, alpha: 1.0)
        if sender.backgroundColor == colorA {
            sender.backgroundColor = colorB
            sender.titleLabel?.alpha = 0

        } else {
            sender.backgroundColor = colorA
            sender.titleLabel?.alpha = 1
        }
    }
}

