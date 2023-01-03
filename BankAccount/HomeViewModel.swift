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

    private let fetchAccountProfileUseCase: FetchAccountProfileUseCaseProtocol = FetchAccountProfileUseCase()
    private let fetchAccountDetailsUseCase: FetchAccountDetailsUseCaseProtocol = FetchAccountDetailsUseCase()
  
    func getAccountsDetails(completion: @escaping ([AccountDetailsResponse]?, NetworkError?) -> Void) {
        let userID = String(Int.random(in: 1...3))
        fetchAccountDetailsUseCase.fetchAccountDetails(id: userID) { result in
            switch result {
            case .success(let accountDetails):
                completion(accountDetails, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getAccountProfileData(completion: @escaping (AccountProfileResponse?, NetworkError?) -> Void) {
        let userID = String(Int.random(in: 1...3))
        fetchAccountProfileUseCase.fetchProfile(id: userID, completion: { result in
            switch result {
            case .success(let profile):
                completion(profile, nil)
            case .failure(let error):
                completion(nil, error)
            }
        })
    }
}
