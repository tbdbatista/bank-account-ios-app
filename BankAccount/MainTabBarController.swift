//
//  MainTabBarController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 28/10/22.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    let mainTabBarViewModel = MainTabBarViewModel()
    let vc1 = HomeViewController()
    let vc2 = TransactionsViewController()
    let vc3 = MoreInformationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTabBarViewModel.delegate = self

        vc1.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        vc2.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Transactions")
        vc3.setTabBarImage(imageName: "ellipsis", title: "More")
        
        self.tabBar.tintColor = .primaryGreen
        self.tabBar.unselectedItemTintColor = .gray
        
        let nc1 = UINavigationController(rootViewController: vc1)
        let nc2 = UINavigationController(rootViewController: vc2)
        let nc3 = UINavigationController(rootViewController: vc3)
        
        nc1.setStatusBar()
        nc1.setNavBarAppearance()
        
        self.viewControllers = [nc1, nc2, nc3]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainTabBarViewModel.callOnboarding()
    }
}

//MARK: - Extension - MainTabBarModelDelegate
extension MainTabBarController: MainTabBarViewModelDelegate {
    func didHaveOnboarded() {
        NavigationLogin.goHome(presenter: self)
    }
    
    func didNotHaveOnboarded() {
        NavigationLogin.goOnboarding(presenter: self)
    }

}
