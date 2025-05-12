//
//  GrowthTimelineView.swift
//  0512
//
//  Created by 張睿恩 on 2025/5/12.
//


import SwiftUI

struct GrowthTimelineView: View {
    let plant: Plant

    var body: some View {
        List {
            if plant.wateringRecords.isEmpty {
                Text("尚無成長歷程")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(plant.records) { record in
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
        .navigationTitle("成長歷程")
    }
}

#Preview {
        GrowthTimelineView(plant: samplePlants[0])
}
