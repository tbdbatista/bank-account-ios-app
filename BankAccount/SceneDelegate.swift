//
//  SceneDelegate.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 21/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let nc = UINavigationController(rootViewController: LoginViewController())
        window.rootViewController = nc
        self.window = window
        window.makeKeyAndVisible()
    }
}


