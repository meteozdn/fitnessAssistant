//
//  RegisterViewModelBuilder.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 15.09.2024.
//

import Foundation

class RegisterViewModelBuilder{
    
   static func make() -> RegisterViewController {
        let vc = RegisterViewController()
        let viewModel = RegisterViewModel(service: NetworkCaller())
        vc.viewModel = viewModel
        return vc
    }
}
