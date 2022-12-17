//
//  HomeViewModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 14/11/22.
//

import Foundation

enum AccountType: String, Codable {
    case Banking
    case CreditCard
    case Investment
    case Cryptocurrency
}

class HomeViewModel {

    private let fetchAccountProfileUseCase = FetchAccountProfileUseCase()
    private let fetchAccountDetailsUseCase = FetchAccountDetailsUseCase()
    
    func fetchAccountsData() -> [HomeAccountModel] {
        let account = HomeAccountModel(accountType: .Banking, accountName: "Single Account", dollars: "90,909", cents:"76")
        let savings = HomeAccountModel(accountType: .Banking, accountName: "Savings", dollars: "123,423", cents:"90")
        let visa = HomeAccountModel(accountType: .CreditCard, accountName: "Visa", dollars: "14,414", cents:"41")
        let investment = HomeAccountModel(accountType: .Investment, accountName: "REIT Investiments Annually", dollars: "980,745,789", cents:"55")
        let crypto = HomeAccountModel(accountType: .Cryptocurrency, accountName: "Bitcoin", dollars: "234,423", cents:"32")
        let accounts = [account, savings, visa, investment, crypto]
        return accounts
    }
    
    func getAccountsDetails(completion: @escaping ([AccountDetailsResponse]?, String?) -> Void) {
        fetchAccountDetailsUseCase.fetchAccountDetails(id: "1") { result in
            switch result {
            case .success(let accountDetails):
                completion(accountDetails, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getAccountProfileData(completion: @escaping (AccountProfileResponse?, String?) -> Void) {
        fetchAccountProfileUseCase.fetchProfile(id: "2", completion: { result in
            switch result {
            case .success(let profile):
                completion(profile, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        })
    }
}
