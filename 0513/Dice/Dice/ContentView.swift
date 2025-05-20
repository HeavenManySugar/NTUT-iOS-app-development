//
//  ContentView.swift
//  Dice
//
//  Created by 張睿恩 on 2025/5/13.
//

import SwiftUI

struct ContentView: View {
    @State private var diceFace: [Int] = [1]

    var body: some View {
        VStack {
            DiceGridView(diceFace: $diceFace)

            Text("總和：\(diceFace.reduce(0, +))")
                .font(.title2)
                .padding()

            Spacer()

            HStack {
                Button("新增骰子") {
                    if diceFace.count < 6 {
                        diceFace.append(Int.random(in: 1...6))
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("全部重擲") {
                    for i in diceFace.indices {
                        diceFace[i] = Int.random(in: 1...6)
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.bottom)
        }
    }
}

struct DiceGridView: View {
    var diceFace: Binding<[Int]>

    var body: some View {
        VStack {
            ForEach(Array(stride(from: 0, to: diceFace.wrappedValue.count, by: 3)), id: \.self) { index in
                HStack {
                    ForEach(index..<min(index + 3, diceFace.wrappedValue.count), id: \.self) { i in
                        DiceView(face: Binding(
                            get: { diceFace.wrappedValue[i] },
                            set: { diceFace.wrappedValue[i] = $0 }
                        ))
                    }
                }
            }
        }
    }
}

struct DiceView: View {
    @Binding var face: Int

    var body: some View {
        Image(systemName: "die.face.\(face).fill")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .onTapGesture {
                face = Int.random(in: 1...6)
            }
    }
}

#Preview {
    ContentView()
}
