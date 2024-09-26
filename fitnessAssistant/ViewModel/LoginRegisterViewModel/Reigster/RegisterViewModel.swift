//
//  RegisterModel.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 15.09.2024.
//

import Foundation

class RegisterViewModel: RegisterViewModelProtocol{

    
    var delegate: RegisterViewModelDelegate?
    let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    
    func register(name: String, surname: String, mail: String, password: String) {
        
        let body:[String: Any] = [
        "name":"kenaan",
        "surname":"bisrkan",
        "username":"kensssobirko",
        "eposta":"kesnsobirkos@gmail.com",
        "password":"raamizsiken19",
        "gender":1,
        ]

        
        service.request(.register, withBody: body, withID: nil) { (result: Result<LoginModel, Error>) in
            switch result{
            case.success:
                self.delegate?.handle("success")
            case.failure:
                self.delegate?.handle("eroor")
            }
        }

    }
    

    
}
