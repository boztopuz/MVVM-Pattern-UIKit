//
//  MainViewModel.swift
//  MVVM Pattern
//
//  Created by Burak Öztopuz on 1.06.2023.
//

import Foundation

class MainViewModal {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: TrendingMovieModel?
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true

        APICaller.getTrendingMovies { result in
            self.isLoading.value = false
            
            switch result {
            case .success(let data):
                self.dataSource = data
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
}
