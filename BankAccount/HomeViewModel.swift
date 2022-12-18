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
