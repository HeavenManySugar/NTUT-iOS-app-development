//
//  PlantDetailView.swift.swift
//  0512
//
//  Created by 張睿恩 on 2025/5/12.
//

import SwiftUI

struct PlantDetailView: View {
    let plant: Plant

    var body: some View {
        VStack {
            Text(plant.name)
                .font(.largeTitle)
                .padding()
            Text(plant.species)
                .font(.title3)
                .foregroundStyle(.secondary)
            if plant.imageNames.isEmpty {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 300)
                    .overlay(Text("無圖片").foregroundColor(.gray))
                    .cornerRadius(12)
                    .padding()
            } else {
                TabView {
                    ForEach(plant.imageNames, id: \.self) { imageName in
                        if let _ = UIImage(named: imageName) {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        } else {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .overlay(Text("無圖片").foregroundColor(.gray))
                                .cornerRadius(12)
                                .padding()
                        }
                    }
                }
                .frame(height: 300)
                .tabViewStyle(.page)
            }

            List {
                NavigationLink(destination: WateringRecordsView(plant: plant)) {
                    Label("澆水紀錄", systemImage: "drop.fill")
                }
                NavigationLink(destination: RepottingRecordsView(plant: plant)) {
                    Label("換盆紀錄", systemImage: "leaf.arrow.circlepath")
                }
                NavigationLink(destination: GrowthTimelineView(plant: plant)) {
                    Label("成長歷程", systemImage: "clock.arrow.circlepath")
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationTitle(plant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PlantDetailView(plant: samplePlants[0])
    }
}
