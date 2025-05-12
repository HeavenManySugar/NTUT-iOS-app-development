//
//  MovieRowView.swift
//  0506-2
//
//  Created by 張睿恩 on 2025/5/6.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(.rect(cornerRadius: 8))
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text("上映年份: \(movie.releaseYear.formatted(.number.grouping(.never)))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    MovieRowView(movie: PixarMoviesListView().pixarMovies[0])
}
