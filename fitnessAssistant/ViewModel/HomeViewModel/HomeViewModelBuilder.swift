//
//  HomeViewModelBuilder.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation

class HomeViewModelBuilder{
    
   static func make() -> HomeViewController {
        let vc = HomeViewController()
        let viewModel = HomeViewModel(service: NetworkCaller())
        vc.viewModel = viewModel
        return vc
    }
}
