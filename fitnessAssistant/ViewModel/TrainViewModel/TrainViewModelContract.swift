//
//  TrainViewModelContract.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 18.09.2024.
//

import Foundation

protocol TrainViewModelProtocol{
    var delegate: TrainViewModelDelegate? {get set}
    func getDailyExercise()
}


protocol TrainViewModelDelegate{
    func handle(_ output: String)
}
