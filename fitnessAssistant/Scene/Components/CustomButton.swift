//
//  CustomButton.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 14.09.2024.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        case small
        case medium
        case big
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize ) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.backgroundColor =  hasBackground ? K.ColorConst.red : .clear
        let titleColor = hasBackground ? .white : K.ColorConst.red
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 14)
 
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
