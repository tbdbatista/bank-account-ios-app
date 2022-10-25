//
//  HomeViewModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 25/10/22.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didNotHaveOnboarded()
}

class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    var hasOnboarded: Bool = false
    
    func callOnboarding() {
        if hasOnboarded == false {
            delegate?.didNotHaveOnboarded()
            hasOnboarded = true // TO-DO: save this state at userDefaults
        }
    }
}
