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
            TabView {
                // 清單模式
                List(plants) { plant in
                    NavigationLink(destination: PlantDetailView(plant: plant)) {
                        HStack {
                            if let image = UIImage(named: plant.imageNames[0]) {
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
                .tabItem {
                    Label("清單", systemImage: "list.bullet")
                }

                // 網格模式
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(plants) { plant in
                            NavigationLink(destination: PlantDetailView(plant: plant)) {
                                VStack {
                                    if let image = UIImage(named: plant.imageNames[0]) {
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
                .tabItem {
                    Label("網格", systemImage: "square.grid.2x2")
                }

                // 卡片模式
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(plants) { plant in
                            NavigationLink(destination: PlantDetailView(plant: plant)) {
                                ZStack(alignment: .bottomLeading) {
                                    if let image = UIImage(named: plant.imageNames[0]) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 200)
                                            .clipped()
                                    } else {
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(height: 200)
                                            .overlay(Text("無圖片").foregroundColor(.gray))
                                    }

                                    Text(plant.name)
                                        .font(.title2)
                                        .bold()
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .foregroundColor(.white)
                                }
                                .cornerRadius(12)
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .tabItem {
                    Label("卡片", systemImage: "rectangle.stack")
                }
            }
            .navigationTitle("全部植物")
        }
    }
}

#Preview {
    AllPlantsView(plants: samplePlants)
}
