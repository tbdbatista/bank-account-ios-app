//
//  NavigationLogin.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 27/10/22.
//

import UIKit

class NavigationLogin {
    
    static func goHome(presenter: UIViewController) {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.selectedIndex = 0
        presenter.goToViewController(navigateTo: mainTabBarController, navigationType: .present, animated: true)
    }
    
    static func goTransactions(presenter: UIViewController) {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.selectedIndex = 1
        presenter.goToViewController(navigateTo: mainTabBarController, navigationType: .present, animated: true)
    }
    
    static func goMore(presenter: UIViewController) {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.selectedIndex = 2
        presenter.goToViewController(navigateTo: mainTabBarController, navigationType: .present, animated: true)
    }
    
    static func goOnboarding(presenter: UIViewController) {
        let onboardingVC = OnboardingContainerViewController()
        presenter.goToViewController(navigateTo: onboardingVC, navigationType: .flipHorizontal, animated: true)
    }
}
