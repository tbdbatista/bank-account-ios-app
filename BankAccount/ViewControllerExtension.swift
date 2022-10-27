//
//  ViewControllerExtension.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 27/10/22.
//

import UIKit

public enum NavigationType {
    case push
    case present
    case show
    case crossDissolve
    case coverVertical
    case partialCurl
    case flipHorizontal
}

extension UIViewController {
    
    public func goToViewController(navigateTo viewController: UIViewController, navigationType: NavigationType, animated: Bool) {
        switch navigationType {
        case .push:
            guard let navigationController = self.navigationController else {
                fatalError("Presenter does not have a navigation controller to push next view controller")
            }
            navigationController.modalPresentationStyle = .overCurrentContext
            navigationController.pushViewController(viewController, animated: animated)
        case .present:
            viewController.modalPresentationStyle = .overCurrentContext
            self.present(viewController, animated: animated, completion: nil)
        case .show:
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = .overCurrentContext
            self.show(navigationController, sender: animated)
        case .crossDissolve:
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.modalTransitionStyle = .crossDissolve
            self.present(viewController, animated: animated, completion: nil)
        case .coverVertical:
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.modalTransitionStyle = .coverVertical
            self.present(viewController, animated: animated, completion: nil)
        case .partialCurl:
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.modalTransitionStyle = .partialCurl
            self.present(viewController, animated: animated, completion: nil)
        case .flipHorizontal:
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.modalTransitionStyle = .flipHorizontal
            self.present(viewController, animated: animated, completion: nil)
        }
    }
}
