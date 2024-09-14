//
//  File.swift
//  moviesApp
//
//  Created by Metehan Özden on 8.09.2024.
//

import UIKit

extension UIViewController {
    var screenWidth: CGFloat{
        return view.frame.width
    }
    var screenHeigh: CGFloat{
        return view.frame.height
    }
}

extension UIView{
    
    var screenWidth: CGFloat{
        return UIScreen.main.bounds.width
    }
    
    var screenHeigh: CGFloat{
        return UIScreen.main.bounds.height
    }
    
    
}
