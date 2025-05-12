//
//  AuthorRow.swift
//  0506
//
//  Created by 張睿恩 on 2025/5/6.
//

import SwiftUI

struct AuthorRow: View {
    let author: Author
    
    var body: some View {
        HStack {
            Image(author.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 2)
                }
                .shadow(color: .primary, radius: 5)
            Text(author.name)
                .font(.headline)
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AuthorRow(author: SampleData.authors[0])
}
