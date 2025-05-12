//
//  PixarMoviesListView.swift
//  0506-2
//
//  Created by 張睿恩 on 2025/5/6.
//

import SwiftUI

struct PixarMoviesListView: View {
    let pixarMovies: [Movie] = [
        Movie(title: "玩具總動員", releaseYear: 1995, imageName: "toystory"),
        Movie(title: "海底總動員", releaseYear: 2003, imageName: "findingnemo"),
        Movie(title: "怪獸電力公司", releaseYear: 2001, imageName: "monstersinc"),
        Movie(title: "超人特攻隊", releaseYear: 2004, imageName: "theincredibles"),
        Movie(title: "汽車總動員", releaseYear: 2006, imageName: "cars"),
        Movie(title: "瓦力", releaseYear: 2008, imageName: "walle"),
        Movie(title: "腦筋急轉彎", releaseYear: 2015, imageName: "insideout"),
        Movie(title: "尋找多莉", releaseYear: 2016, imageName: "findingdory"),
        Movie(title: "Coco 可可夜總會", releaseYear: 2017, imageName: "coco"),
        Movie(title: "玩具總動員4", releaseYear: 2019, imageName: "toystory4")
    ]

    var body: some View {
        NavigationStack {
            List(pixarMovies) { movie in
                MovieRowView(movie: movie)
            }
            .navigationTitle("皮克斯動畫電影")
        }
    }
}

#Preview {
    PixarMoviesListView()
}
