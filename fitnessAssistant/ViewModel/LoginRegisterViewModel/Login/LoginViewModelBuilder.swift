//
//  LoginViewModelBuilder.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 15.09.2024.
//

import Foundation

class LoginViewModelBuilder{
    
   static func make() -> LoginViewController {
        let vc = LoginViewController()
        let viewModel = LoginViewModel(service: NetworkCaller())
        vc.viewModel = viewModel
        return vc
    }
}
