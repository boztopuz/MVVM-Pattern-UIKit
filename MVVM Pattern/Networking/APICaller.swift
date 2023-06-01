//
//  APICaller.swift
//  MVVM Pattern
//
//  Created by Burak Öztopuz on 1.06.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseDate
}

class APICaller {
    
    static func getTrendingMovies(complitionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void){
        
        let urlString = NetworkConstants.shared.serverAddress + "trending/movie/day?api_key=" + NetworkConstants.shared.apiKey
      
        guard let url = URL(string: urlString) else {
            complitionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
                let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data){
                complitionHandler(.success(resultData))
            }else{
                complitionHandler(.failure(.canNotParseDate))
            }
        }.resume()
    }
    
}
