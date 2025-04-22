import UIKit

var message = "👋🏼 Hello, 世界🌏"

let index1 = message.index(message.startIndex, offsetBy: 0)
let index2 = message.index(message.startIndex, offsetBy: 2)
let index3 = message.index(message.startIndex, offsetBy: 9)

print("\(message[index1])\(message[index2])\(message[index3])")

