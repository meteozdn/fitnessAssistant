//
//  HomeViewModel.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol{
    var delegate: HomeViewModelDelegate?
    let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func load() {
        service.fetchData(.exercises) { (result: Result<ExerciseModel, Error>) in
            switch result{
            case.success:
               print("success")
            case.failure:
                print("fail")
            }
        }
    }
    
}
