//
//  HomeAccountModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 14/11/22.
//

import Foundation

struct HomeAccountModel {
    let accountType: AccountType
    let accountName: String
    let dollars: String
    let cents: String
}

enum AccountType: String, Codable {
    case Banking
    case CreditCard
    case Investment
    case Cryptocurrency
}
