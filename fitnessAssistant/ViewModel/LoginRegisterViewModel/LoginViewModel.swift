//
//  LoginViewModel.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 15.09.2024.
//

import Foundation


class LoginViewModel: LoginViewModelProtocol{
    var delegate: LoginViewModelDelegate?
    let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func login() {
        service
    }
    
}
