//
//  LoginViewController.swift
//  moviesApp
//
//  Created by Metehan Özden on 9.09.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let authHeader = AuthHeaderView(title: "Hoşgeldin", subtitle: "Giriş yapmak için bilgilerini gir")
    let emailField = CustomTextField(authType: .email)
    let passwordField = CustomTextField(authType: .password)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        self.view.addSubview(authHeader)
        authHeader.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(200)
        }
        
        self.view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.top.equalTo(authHeader.snp.bottom).offset(40)
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
        
        let signInButton = CustomButton(title: "Giriş", hasBackground: true, fontSize: .big)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        self.view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        let signUpButton = CustomButton(title: "Yeni Kullanıcı Mısın? Üye Ol.", hasBackground: false, fontSize: .medium)
        signUpButton.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        self.view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }


        let forgotPassword = CustomButton(title: "Şifremi Unuttum.", hasBackground: false, fontSize: .small)
        forgotPassword.addTarget(self, action: #selector(goToForgotPassword), for: .touchUpInside)
        self.view.addSubview(forgotPassword)
        forgotPassword.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc private func goToForgotPassword(){
        print("goToForgotPassword")

    }
    @objc private func goToSignUp(){
        let registerVC = RegisterViewController()
        let navController = UINavigationController(rootViewController: registerVC)
        self.present(navController, animated: true)
        print("SIGNUP")
        
    }
    @objc private func signIn(){
        print("signIn")

    }


}
