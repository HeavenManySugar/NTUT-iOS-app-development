//
//  WateringRecordsView.swift
//  0512
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct WateringRecordsView: View {
    let plant: Plant

    var body: some View {
        List {
            if plant.wateringRecords.isEmpty {
                Text("尚無澆水紀錄")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(plant.wateringRecords) { record in
                    VStack(alignment: .leading) {
                        Text(record.date, style: .date)
                            .font(.headline)
                        Text(record.notes)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("澆水紀錄")
    }
}

#Preview {
    WateringRecordsView(plant: samplePlants[0])
}
