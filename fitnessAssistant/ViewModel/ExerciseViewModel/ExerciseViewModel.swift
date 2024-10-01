//
//  ExerciseViewModel.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 24.09.2024.
//

import Foundation

class ExerciseViewModel: ExerciseViewModelProtocol{
    
    var delegate: ExerciseViewModelDelegate?
    let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func getExercise(_ id: Int) {
        service.request(.exercise, withBody: nil, withID: id) { (result: Result<Exercises, Error>) in
            switch result{
            case.success(let exercises):
                self.delegate?.handle(.exercises(exercises))
            case.failure:
                print("fail")
            }
        }

    }
}
