//
//  LoginViewModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 22/10/22.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func didLogin()
    func setErrorWarningsLabel()
}

class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate?
    
    private var errorWarningState : ErrorWarningState?
    
    func getErrorWarningState() -> ErrorWarningState? {
        return errorWarningState
    }
    
    func setErrorWarningState(with errorWarning: ErrorWarningState?) {
        self.errorWarningState = errorWarning
    }
    
    func login(username: String?, password: String?) {
        
        guard let username = username, let password = password else {
            assertionFailure("Username and password should not be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            setErrorWarningState(with: .emptyLoginInput)
            delegate?.setErrorWarningsLabel()
            return
        }
        
        if username == "thiago.batista" && password == "password" {
            print("Login Successfully")
            setErrorWarningState(with: nil)
            delegate?.setErrorWarningsLabel()
            delegate?.didLogin()
        } else {
            print("Login Error")
            setErrorWarningState(with: .incorrectLoginInput)
            delegate?.setErrorWarningsLabel()
            return
        }
    }
    
}
