//
//  RegisterViewController.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 14.09.2024.
//

import UIKit

class RegisterViewController: UIViewController {

    var viewModel: RegisterViewModel?

    let authHeader = AuthHeaderView(title: "Hoşgeldin", subtitle: "Kayıt olmak için bilgilerini gir")
    let emailField = CustomTextField(authType: .email)
    let passwordField = CustomTextField(authType: .password)
    let nameField = CustomTextField(authType: .name)
    let surnameField = CustomTextField(authType: .surname)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        self.view.addSubview(authHeader)
        authHeader.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(80)
            make.height.equalTo(200)
        }
        
        
        self.view.addSubview(nameField)
        nameField.snp.makeConstraints { make in
            make.top.equalTo(authHeader.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(surnameField)
        surnameField.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }

        self.view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.top.equalTo(surnameField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        
        
        self.view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
               
        let signUpButton = CustomButton(title: "Kayıt Ol", hasBackground: true, fontSize: .big)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        self.view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        let signInButton = CustomButton(title: "Hesabın var mı? Giriş Yap.", hasBackground: false, fontSize: .medium)
        signInButton.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
        self.view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }


        
    }
    
    @objc private func goToSignIn(){
        self.dismiss(animated: true, completion: nil)

    }
    @objc private func signUp(){
        if let name = nameField.text, let surname = surnameField.text, let mail = emailField.text, let password = passwordField.text {
            viewModel?.register(name: name, surname: surname, mail: mail, password: password)
        }
        
        print("kayıtOl")
        
    }
}
