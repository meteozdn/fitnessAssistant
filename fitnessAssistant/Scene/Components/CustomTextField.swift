//
//  CustomTextField.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 14.09.2024.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType{
        case username
        case email
        case password
        case name
        case surname
        case search
    }
    
    private let authType: CustomTextFieldType
    
    init(authType: CustomTextFieldType) {
        self.authType = authType
        super.init(frame: .zero)
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        switch authType {
        case .username:
            self.placeholder = "Kullanıcı adı"
        case .email:
            self.placeholder = "Email"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Şifre"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .name:
            self.placeholder = "İsim"
        case .surname:
            self.placeholder = "Soyisim"
        case .search:
            self.placeholder = "Ara"
            self.clearButtonMode = .whileEditing
            self.returnKeyType = .search
            let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
            searchIcon.contentMode = .scaleAspectFit
            searchIcon.tintColor = .gray
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            searchIcon.frame = CGRect(x: 5, y: 0, width: 20, height: 20)
            paddingView.addSubview(searchIcon)
            self.rightView = paddingView
            self.rightViewMode = .always


            
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
