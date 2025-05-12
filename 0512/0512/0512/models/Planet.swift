//
//  Planet.swift
//  0512
//
//  Created by 張睿恩 on 2025/5/12.
//

import Foundation
import SwiftUI

// 定義植物資料結構
struct Plant: Identifiable {
    let id = UUID()
    var name: String
    var species: String
    var imageName: String
    var wateringRecords: [WateringRecord]
    var repottingRecords: [RepottingRecord]
    var records: [GrowthRecord]
}

// 定義澆水紀錄
struct WateringRecord: Identifiable {
    let id = UUID()
    var date: Date
    var notes: String
}

// 定義換盆紀錄
struct RepottingRecord: Identifiable {
    let id = UUID()
    var date: Date
    var notes: String
}

// 定義成長紀錄
struct GrowthRecord: Identifiable {
    let id = UUID()
    let date: Date
    let notes: String
}
