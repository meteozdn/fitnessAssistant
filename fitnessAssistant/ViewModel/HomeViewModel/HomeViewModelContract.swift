//
//  HomeModelContract.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation


protocol HomeViewModelProtocol{
    var delegate: HomeViewModelDelegate? {get set}
    func load()
    
}


protocol HomeViewModelDelegate{
    func handle(_ output: String)
}
