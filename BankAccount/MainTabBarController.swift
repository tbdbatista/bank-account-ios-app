//
//  MainTabBarController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 28/10/22.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    let vc1 = HomeViewController()
    let vc2 = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        self.viewControllers = [vc1, vc2]
    }
}
