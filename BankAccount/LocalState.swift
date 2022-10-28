//
//  LocalState.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 27/10/22.
//

import Foundation

class LocalState {
    
    static var userDefaults = UserDefaults.standard
    
    enum Keys: String {
        case hasOnboarded
    }
    
    static var hasOnboarded: Bool {
        get {
            return userDefaults.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue) {
            userDefaults.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            userDefaults.synchronize()  // This line is required only for iOS 12 or below
        }
    }
}

