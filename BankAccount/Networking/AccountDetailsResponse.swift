//
//  AccountDetailsResponse.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 16/12/22.
//

import Foundation

struct AccountDetailsResponse: Codable {
    let id: String
    let type: AccountType
    let name: String
    let amount: Double
    let createdDateTime: Date
    
    static func makeSkeleton() -> AccountDetailsResponse {
        return AccountDetailsResponse(id: "1", type: .Banking, name: "Account name", amount: 0.0, createdDateTime: Date())
    }
}
