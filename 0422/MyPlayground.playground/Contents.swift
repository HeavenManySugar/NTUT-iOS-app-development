import UIKit

protocol Animal {
    func makeSound()
}

class Dog: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("I'm \(name), woof woof!")
    }
}

class Cat: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("I'm \(name), meow meow!")
    }
}

func letAnimalsMakeSound(animals: [Animal]) {
    for animal in animals {
        animal.makeSound()
    }
}

let dog = Dog(name: "Lucky")
let cat = Cat(name: "Lucy")
letAnimalsMakeSound(animals: [dog, cat])
