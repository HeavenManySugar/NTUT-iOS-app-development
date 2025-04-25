//
//  ShowChatViewController.swift
//  midterm
//
//  Created by 張睿恩 on 2025/4/24.
//

import UIKit

class ShowChatViewController: UIViewController {
    var prompt = ""

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Task {
            await streamOpenAIResponse(prompt: prompt, textView: textView)
        }
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
