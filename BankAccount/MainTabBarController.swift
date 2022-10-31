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
    let vc2 = TransactionsViewController()
    let vc3 = MoreInformationViewController()
    let vc4 = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vc1.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        vc2.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Transactions")
        vc3.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        vc4.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Teste")
        
        let nc1 = UINavigationController(rootViewController: vc1)
        let nc2 = UINavigationController(rootViewController: vc2)
        let nc3 = UINavigationController(rootViewController: vc3)
        let nc4 = UINavigationController(rootViewController: vc4)
        
        nc1.setStatusBar()
        
        self.viewControllers = [nc1, nc2, nc3, nc4]
    }
}
