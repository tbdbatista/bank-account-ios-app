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
    
    weak var delegate: HomeViewModelDelegate?
    static var hasOnboarded: Bool?
    
    func callOnboarding() {
        if HomeViewModel.hasOnboarded != true {
            delegate?.didNotHaveOnboarded()
            HomeViewModel.hasOnboarded = true // TO-DO: save this state at userDefaults
        } else {
            delegate?.didHaveOnboarded()
        }
    }
}
