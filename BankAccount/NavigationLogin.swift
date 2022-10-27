//
//  NavigationLogin.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 27/10/22.
//

import UIKit

class NavigationLogin {
    
    var presenter: UIViewController
   
    init(presenter: UIViewController) {
        self.presenter = presenter
    }
    
    class func goHome(presenter: UIViewController) {
        let homeVC = HomeViewController()
        presenter.goToViewController(navigateTo: homeVC, navigationType: .crossDissolve, animated: true)
    }
    
    class func goOnboarding(presenter: UIViewController) {
        let onboardingVC = OnboardingContainerViewController()
        presenter.goToViewController(navigateTo: onboardingVC, navigationType: .flipHorizontal, animated: true)
    }
}
