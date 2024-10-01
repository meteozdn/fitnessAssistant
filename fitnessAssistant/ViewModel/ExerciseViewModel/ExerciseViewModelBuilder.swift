//
//  ExerciseViewModelBuilder.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 24.09.2024.
//

class ExerciseViewModelBuilder{
    
    static func make(id: Int) -> ExercisesViewController {
        let vc = ExercisesViewController()
        let viewModel = ExerciseViewModel(service: NetworkCaller())
        vc.viewModel = viewModel
        vc.viewModel?.getExercise(id + 1)
        return vc
    }

}
