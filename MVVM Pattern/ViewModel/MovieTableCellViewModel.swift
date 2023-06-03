//
//  MovieTableCellViewModel.swift
//  MVVM Pattern
//
//  Created by Burak Öztopuz on 3.06.2023.
//

import Foundation

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.date = movie.releaseDate
        self.rating = "\(movie.voteAverage)/10"
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String)-> URL?{
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}
