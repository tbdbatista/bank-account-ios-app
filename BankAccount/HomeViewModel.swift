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

    func fetchData() -> [HomeModel] {
        let account = HomeModel(accountType: .Banking, accountName: "Single Account", dollars: "90,909", cents:"76")
        let savings = HomeModel(accountType: .Banking, accountName: "Savings", dollars: "123,423", cents:"90")
        let visa = HomeModel(accountType: .CreditCard, accountName: "Visa", dollars: "14,414", cents:"41")
        let investment = HomeModel(accountType: .Investment, accountName: "REITs", dollars: "745,789", cents:"55")
        let crypto = HomeModel(accountType: .Cryptocurrency, accountName: "Bitcoin", dollars: "234,423", cents:"32")
        let accounts = [account, savings, visa, investment, crypto]
        return accounts
    }
}
