//
//  RegisterViewModelContract.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 15.09.2024.
//

import Foundation

protocol RegisterViewModelProtocol{
    var delegate: RegisterViewModelDelegate? {get set}
    func register(name: String, surname: String ,mail: String, password: String )
}


protocol RegisterViewModelDelegate{
    func handle(_ output: String)
}
