import UIKit

var scores = [String:Int]()
scores["Amy"] = 60
scores["Alex"] = 100
scores["John"] = 80
scores

scores["David"] = 88
scores

scores["Amy"] = 70
scores

scores["Alex"] = nil
scores

var total = 0
var cnt = 0

for (name, score) in scores {
    total += score
    cnt += 1
}

print("Average Score: \(total / cnt)")

for (name, score) in scores {
    print("\(name): \(score)")
}

