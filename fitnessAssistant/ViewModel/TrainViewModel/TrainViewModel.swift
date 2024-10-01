//
//  TrainViewModel.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 18.09.2024.
//

import Foundation

class TrainViewModel: TrainViewModelProtocol{
    
    var delegate: TrainViewModelDelegate?
    let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }

    func getDailyExercise() {
        service.request(.allCategories, withBody: nil, withID: nil) { (result: Result<MainCategories, Error>) in
            //print(result)
            switch result{
            case.success:
               print("success")
            case.failure:
                print("fail")
            }
        }

    }
}

