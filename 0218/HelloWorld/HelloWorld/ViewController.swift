//
//  ViewController.swift
//  HelloWorld
//
//  Created by 張睿恩 on 2025/2/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func clickButton(_ sender: Any) {
        
        myLabel.text = "Hello, World!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

