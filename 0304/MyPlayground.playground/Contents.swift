import UIKit

var var1:Int! = 9

var var2:Int? = 3

var var3 = var1 + var2!

var x1:Int? = 3
var x2:Int? = 4

if let y1 = x1{
    print(y1)
    if let y2 = x2 {
        print(y2)
        print(y1 + y2)
    }
}

var score:Int? = 90
var testScore = score ?? 60
score = nil
testScore = score ?? 60
