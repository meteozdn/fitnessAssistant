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
        
        let vc = MainViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }




}

