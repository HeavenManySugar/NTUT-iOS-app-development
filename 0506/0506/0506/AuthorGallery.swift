//
//  AuthorGallery.swift
//  0506
//
//  Created by 張睿恩 on 2025/5/6.
//

import SwiftUI

struct AuthorGallery: View {
    let authors = SampleData.authors
    var body: some View {
        NavigationStack {
            List(authors) {
                author in AuthorRow(author: author)
            }
            .navigationTitle("推理小說作家")
        }
    }
}

#Preview {
    AuthorGallery()
}
