//
//  HomeViewModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 25/10/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didNotHaveOnboarded()
    func didHaveOnboarded()
}

class HomeViewModel {
    
    let userDefaults = UserDefaults.standard
    weak var delegate: HomeViewModelDelegate?
    static let hasOnboarded = "hasOnboarded"
    
    func callOnboarding() {
        if getHasOnboarded() != true {
            delegate?.didNotHaveOnboarded()
            setHasOnboarded(didOnboarded: true)
        }
    }
    
    func setHasOnboarded(didOnboarded: Bool) {
        userDefaults.set(didOnboarded, forKey: HomeViewModel.hasOnboarded)
    }
    
    func getHasOnboarded() -> Bool {
        return userDefaults.bool(forKey: HomeViewModel.hasOnboarded)
    }
}
