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

    private let fetchAccountProfileUseCase = FetchAccountProfileUseCase()
    
    func fetchData() -> [HomeAccountResponse] {
        let account = HomeAccountResponse(accountType: .Banking, accountName: "Single Account", dollars: "90,909", cents:"76")
        let savings = HomeAccountResponse(accountType: .Banking, accountName: "Savings", dollars: "123,423", cents:"90")
        let visa = HomeAccountResponse(accountType: .CreditCard, accountName: "Visa", dollars: "14,414", cents:"41")
        let investment = HomeAccountResponse(accountType: .Investment, accountName: "REIT Investiments Annually", dollars: "980,745,789", cents:"55")
        let crypto = HomeAccountResponse(accountType: .Cryptocurrency, accountName: "Bitcoin", dollars: "234,423", cents:"32")
        let accounts = [account, savings, visa, investment, crypto]
        return accounts
    } 

    var firstName: String?
    var lastName: String?
    
    func getAccountProfileData(completion: @escaping (String?, String?) -> Void) {
        fetchAccountProfileUseCase.fetchProfile(id: "1", completion: { result in
            switch result {
            case .success(let profile):
                self.firstName = profile.firstName
                self.lastName = profile.lastName
                completion(self.firstName! + self.lastName!, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        })
    }
}
