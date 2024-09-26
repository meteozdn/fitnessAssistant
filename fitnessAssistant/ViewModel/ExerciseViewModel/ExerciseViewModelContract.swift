//
//  ExerciseViewModelContract.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 24.09.2024.
//

import Foundation

protocol ExerciseViewModelProtocol{
    var delegate: ExerciseViewModelDelegate? {get set}
    func getExercise(_ id: Int)
}
enum ExerciseModelOutput {
    case exercises(Exercises)
    case error(Error)
}

protocol ExerciseViewModelDelegate{
    func handle(_ output: ExerciseModelOutput)
}
