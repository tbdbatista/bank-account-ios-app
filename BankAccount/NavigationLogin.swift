//
//  NavigationLogin.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 27/10/22.
//

import UIKit

class NavigationLogin {
    
    static func goHome(presenter: UIViewController) {
        let tabBarController = UITabBarController()
        let vc1 = HomeViewController()
        let vc2 = LoginViewController()
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        tabBarController.viewControllers = [vc1, vc2]
        presenter.goToViewController(navigateTo: tabBarController, navigationType: .present, animated: true)
    }
    
    static func goOnboarding(presenter: UIViewController) {
        let onboardingVC = OnboardingContainerViewController()
        presenter.goToViewController(navigateTo: onboardingVC, navigationType: .flipHorizontal, animated: true)
    }
}
