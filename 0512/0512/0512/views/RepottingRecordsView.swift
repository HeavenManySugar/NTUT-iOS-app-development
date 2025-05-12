//
//  RepottingRecordsView.swift
//  0512
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct RepottingRecordsView: View {
    let plant: Plant

    var body: some View {
        List {
            if plant.repottingRecords.isEmpty {
                Text("尚無換盆紀錄")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(plant.repottingRecords) { record in
                    HStack {
                        Text(record.date.formatted(date: .abbreviated, time: .omitted))
                            .font(.headline)
                        Spacer()
                        Text(record.notes)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("換盆紀錄")
    }
}

#Preview {
    RepottingRecordsView(plant: samplePlants[0])
}
