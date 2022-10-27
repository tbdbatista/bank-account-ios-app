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
