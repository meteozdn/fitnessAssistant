//
//  HomeModelContract.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation


protocol HomeViewModelProtocol{
    var delegate: HomeViewModelDelegate? {get set}
    func getMuscleCategories()
}

enum MuscleOutput {
    case muscle(MainCategories)
    case error(Error)
}

protocol HomeViewModelDelegate{
    func handle(_ output: MuscleOutput)
}
