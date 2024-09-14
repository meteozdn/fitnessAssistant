//
//  MainViewController.swift
//  fitnessAssistant
//
//  Created by Metehan Özden on 9.09.2024.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createTabbar()
    }
    
    private func createTabbar()  {
        let vcFirst = createNav(image: "house", title: "Home", vc: HomeViewModelBuilder.make())
        let vcSecond = createNav(image: "figure.run", title: "Train", vc: TrainingViewController())
        let vcThird = createNav(image: "chart.bar", title: "Activity", vc: ActivityViewController())
        let vcFourth = createNav(image: "person", title: "Profile", vc: ProfileViewController())
  
        self.tabBar.tintColor = UIColor(named: "ProjectRedColor")
        setViewControllers([vcFirst,vcSecond, vcFirst, vcThird, vcFourth], animated: true)
    }
    
    private func createNav(image: String, title: String, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage(systemName: image)
        nav.title = title
        return nav
    }

}
