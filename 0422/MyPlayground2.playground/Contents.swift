import UIKit

struct Student: Hashable {
    let id: Int
    let name: String

    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

func printAttendanceSummary(_ records: [Student: Int]) {
    for (student, count) in records {
        print("\(student.name) (ID: \(student.id)) - \(count) times")
    }
}

var attendance: [Student: Int] = [:]

let s1 = Student(id: 1, name: "Lucky")
let s2 = Student(id: 2, name: "Mimi")
let s3 = Student(id: 1, name: "Lucas")

attendance[s1] = 3
attendance[s2] = 5
attendance[s3, default: 0] += 2

printAttendanceSummary(attendance)
