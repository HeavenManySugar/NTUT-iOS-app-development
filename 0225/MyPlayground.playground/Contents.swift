import UIKit

var str = "Hello, playground"

let messageLabel = UILabel(frame: CGRectMake(0,0,300,50))
messageLabel.text = str
messageLabel


messageLabel.backgroundColor = UIColor.yellow
messageLabel.textAlignment = NSTextAlignment.center
messageLabel.layer.cornerRadius = 10.0
messageLabel
messageLabel.clipsToBounds = true

let label = UILabel(frame: CGRect(x: 50, y: 100, width: 250, height: 50))
label.text = "Hello, Swift!"
label.textAlignment = .center
label.font = UIFont.systemFont(ofSize: 24)
label.textColor = .white
label.backgroundColor = .blue
