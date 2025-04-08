// import UIKit

enum Day {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

func dayType(for day: Day) -> String {
    switch day {
    case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday:
        return "Weekday"
    case .Saturday, .Sunday:
        return "Weekend"
    }
}

print(dayType(for: .Sunday))

print(dayType(for: .Tuesday))

