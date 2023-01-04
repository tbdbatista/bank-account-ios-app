//
//  HomeViewModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 14/11/22.
//

import Foundation

class HomeViewModel {

    var fetchAccountProfileUseCase: FetchAccountProfileUseCaseProtocol = FetchAccountProfileUseCase()
    var fetchAccountDetailsUseCase: FetchAccountDetailsUseCaseProtocol = FetchAccountDetailsUseCase()
  
    func getAccountsDetails(forceRefresh: Bool, completion: @escaping ([AccountDetailsResponse]?, NetworkError?) -> Void) {
        let userID = String(Int.random(in: 1...3))
        fetchAccountDetailsUseCase.fetchAccountDetails(id: userID, forceRefresh: forceRefresh) { result in
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
