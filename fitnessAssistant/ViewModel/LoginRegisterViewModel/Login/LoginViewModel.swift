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
    let sharedPreference = SharedPreferenceManager.instance
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func login(mail: String, password: String) {
        let body:[String: Any] = [
        "eposta": mail,
        "password": password,
        ]
        print("aaaa")
        service.request(.login, withBody: body, withID: nil) { (result: Result<LoginModel, Error>) in
            print(result)
            switch result{
            case.success(let result):
                if let success = result.success {
                    if success {

                        self.saveUserInfo(result)
                    }
                }
                self.delegate?.handle(.loginModel(result))
            case.failure(let error):
                self.delegate?.handle(.error(error))
            }
        }

    }
    
    
    func saveUserInfo(_ user: LoginModel){
        if let id = user.id {
            sharedPreference.saveUserCredential(id)
        }
    }
    
    func getUserInfo() -> Int?{
        return sharedPreference.getUserCredential()
    }
    
    func goToMainPage(){
        
    }

    
}


