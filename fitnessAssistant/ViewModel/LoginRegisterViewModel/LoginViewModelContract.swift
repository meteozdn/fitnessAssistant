//
//  LoginViewModelContract.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 15.09.2024.
//

import Foundation

protocol LoginViewModelProtocol{
    var delegate: LoginViewModelDelegate? {get set}
    func login()
    
}


protocol LoginViewModelDelegate{
    func handle(_ output: String)
}
