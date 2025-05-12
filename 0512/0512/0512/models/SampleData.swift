//
//  SampleData.swift
//  0512
//
//  Created by 張睿恩 on 2025/5/12.
//

import Foundation
import SwiftUI

let samplePlants: [Plant] = [
    Plant(
        name: "小綠",
        species: "多肉植物",
        imageName: "succulent1",
        wateringRecords: [
            WateringRecord(date: Date(timeIntervalSinceNow: -86400 * 3), notes: "澆了少量水"),
            WateringRecord(date: Date(timeIntervalSinceNow: -86400 * 10), notes: "整盆泡水法")
        ],
        repottingRecords: [
            RepottingRecord(date: Date(timeIntervalSinceNow: -86400 * 30), notes: "換成透氣盆")
        ],
        records: [
            GrowthRecord(date: Date(timeIntervalSinceNow: -86400 * 30), notes: "剛入手，葉片緊實"),
            GrowthRecord(date: Date(timeIntervalSinceNow: -86400 * 15), notes: "葉片變胖"),
            GrowthRecord(date: Date(timeIntervalSinceNow: -86400 * 3), notes: "明顯長大")
        ]
    ),
    Plant(
        name: "香香",
        species: "迷迭香",
        imageName: "rosemary1",
        wateringRecords: [
            WateringRecord(date: Date(timeIntervalSinceNow: -86400 * 5), notes: "澆了半杯水")
        ],
        repottingRecords: [],
        records: [
            GrowthRecord(date: Date(timeIntervalSinceNow: -86400 * 20), notes: "初來乍到"),
            GrowthRecord(date: Date(timeIntervalSinceNow: -86400 * 7), notes: "葉子變深綠")
        ]
    )
]
