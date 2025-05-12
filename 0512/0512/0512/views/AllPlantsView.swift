//
//  AllPlantsView.swift
//  0512
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct AllPlantsView: View {
    let plants: [Plant]
    @State private var isListView: Bool = true

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            VStack {
                Picker("顯示模式", selection: $isListView) {
                    Text("清單").tag(true)
                    Text("網格").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if isListView {
                    List(plants) { plant in
                        NavigationLink(destination: PlantDetailView(plant: plant)) {
                            HStack {
                                if let image = UIImage(named: plant.imageName) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } else {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 50, height: 50)
                                        .overlay(Text("無圖片").foregroundColor(.gray))
                                }
                                Text(plant.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(plants) { plant in
                                NavigationLink(destination: PlantDetailView(plant: plant)) {
                                    VStack {
                                        if let image = UIImage(named: plant.imageName) {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150, height: 150)
                                                .clipped()
                                                .cornerRadius(12)
                                        } else {
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.2))
                                                .frame(width: 150, height: 150)
                                                .overlay(Text("無圖片").foregroundColor(.gray))
                                                .cornerRadius(12)
                                        }

                                        Text(plant.name)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("全部植物")
        }
    }
}

#Preview {
    AllPlantsView(plants: samplePlants)
}
