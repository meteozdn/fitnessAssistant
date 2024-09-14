//
//  shadow+UIView.swift
//  moviesApp
//
//  Created by Metehan Özden on 9.09.2024.
//

import UIKit

extension UIView{
    
    
    func dropShadow(scale: Bool = true, radius: CGFloat){
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 3
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        layer.cornerRadius = 10
        
    }
    
}
