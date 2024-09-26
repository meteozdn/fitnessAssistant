//
//  TrainViewModelBuilder.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 18.09.2024.
//

import Foundation

class TrainViewModelBuilder{
    
   static func make() -> TrainingViewController {
        let vc = TrainingViewController()
        let viewModel = TrainViewModel(service: NetworkCaller())
        vc.viewModel = viewModel
        return vc
    }

}
