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
    
    func login(mail: String, password: String) {
        
        service.request(.login, withBody: nil) { (result: Result<LoginModel, Error>) in
            switch result{
            case.success:
                self.delegate?.handle("success")
            case.failure:
                self.delegate?.handle("eroor")
            }
        }
    }
    
}
