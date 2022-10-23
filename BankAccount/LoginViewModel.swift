//
//  LoginViewModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 22/10/22.
//

import Foundation

class LoginViewModel {
    
    private var errorWarningState : ErrorWarningState?
    
    init() {
        //self.errorWarningState = .emptyInput
    }
    
    func getErrorWarningState() -> ErrorWarningState? {
        return errorWarningState
    }
    
    func setErrorWarningState(with errorWarning: ErrorWarningState?) {
        self.errorWarningState = errorWarning
    }
    
}
