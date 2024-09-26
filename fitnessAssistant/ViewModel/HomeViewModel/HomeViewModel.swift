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
    
    func getMuscleCategories() {
        
        service.request(.allCategories, withBody: nil, withID: nil) { (result: Result<MainCategories, Error>) in
           // print(result)
            switch result{
            case.success(let category):
                self.delegate?.handle(.muscle(category))
            case.failure:
                print("fail")
            }
        }
        
    }
    
}
