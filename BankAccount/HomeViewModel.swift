//
//  HomeViewModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 14/11/22.
//

import Foundation

enum AccountType: String {
    case Banking
    case CreditCard
    case Investment
    case Cryptocurrency
    
}
class HomeViewModel {
    
    let accountType: AccountType? = nil
    let accountName: String? = nil
}
