//
//  AppDelegate.swift
//  moviesApp
//
//  Created by Metehan Özden on 16.08.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let sharedPreference = SharedPreferenceManager.instance
        if let isUserAllreadyLogin = sharedPreference.getUserCredential() {
            if isUserAllreadyLogin > 0 {
                let vc = MainViewController()
                window?.rootViewController = vc
                window?.makeKeyAndVisible()
                return true
            }
        }
        let vc = LoginViewModelBuilder.make()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true

    }

}

