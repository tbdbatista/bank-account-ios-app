//
//  MainTabBarViewModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 07/11/22.
//

import Foundation

protocol MainTabBarViewModelDelegate: AnyObject {
    func didNotHaveOnboarded()
    func didHaveOnboarded()
}

class MainTabBarViewModel {
    
    let userDefaults = UserDefaults.standard
    weak var delegate: MainTabBarViewModelDelegate?
    
    func callOnboarding() {
        if getHasOnboarded() != true {
            delegate?.didNotHaveOnboarded()
            setHasOnboarded(newValue: true)
        }
    }
    
    func setHasOnboarded(newValue: Bool) {
        LocalState.hasOnboarded = newValue
    }
    
    func getHasOnboarded() -> Bool {
        return LocalState.hasOnboarded
    }
}
