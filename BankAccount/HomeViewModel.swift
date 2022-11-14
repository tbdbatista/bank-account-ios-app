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
    
    var rawValue: String {
        switch self {
        case .Cryptocurrency:
            return "Cryptocurrency"
        case .Banking:
            return "Banking"
        case .Investment:
            return "Investment"
        case .CreditCard:
            return "Credit Card"
        }
    }
}

class HomeViewModel {

    func fetchData() -> [HomeModel] {
        let account = HomeModel(accountType: .Banking, accountName: "Conta Corrente")
        let savings = HomeModel(accountType: .Banking, accountName: "Poupança")
        let visa = HomeModel(accountType: .CreditCard, accountName: "Visa")
        let investment = HomeModel(accountType: .Investment, accountName: "REIT Receipt")
        let crypto = HomeModel(accountType: .Cryptocurrency, accountName: "Bitcoin")
        let accounts = [account, savings, visa, investment, crypto]
        return accounts
    }
}
