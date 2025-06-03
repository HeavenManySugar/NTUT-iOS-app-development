//
//  Item.swift
//  demo
//
//  Created by 張睿恩 on 2025/5/27.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
