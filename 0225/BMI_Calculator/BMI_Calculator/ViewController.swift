//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by 張睿恩 on 2025/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bmiResultLabel: UILabel!
    @IBOutlet weak var weightStatusLabel: UILabel!
    @IBOutlet weak var sexField: UISegmentedControl!
    @IBAction func caculateBMI(_ sender: Any) {
        let h = Float(heightField.text!)! / 100
        let w = Float(weightField.text!)!
        let bmi = w / (h * h)
        bmiResultLabel.text = String(bmi)
        if 18.5 <= bmi && bmi < 25 {
            weightStatusLabel.text = "Healthy weight"
        } else if bmi < 18.5 {
            weightStatusLabel.text = "Underweight"
        } else if sexField.selectedSegmentIndex == 0 {
            if 25 <= bmi && bmi < 30 {
                weightStatusLabel.text = "Overweight"
            } else {
                weightStatusLabel.text = "Obesity"
            }
        } else {
            weightStatusLabel.text = "it’s a secret"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
