//
//  SecondView.swift
//  0506-3
//
//  Created by 張睿恩 on 2025/5/6.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Second Page")
            NavigationLink("Go") {
                ThirdView()
            }
        }
        .navigationTitle("Second Page")
    }
}

#Preview {
    SecondView()
}
