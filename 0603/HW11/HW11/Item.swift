//
//  Item.swift
//  HW11
//
//  Created by 張睿恩 on 2025/6/3.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String
    var amount: Double
    var timestamp: Date

    init(name: String = "", amount: Double = 0, timestamp: Date) {
        self.timestamp = timestamp
        self.name = name
        self.amount = amount
    }
}
