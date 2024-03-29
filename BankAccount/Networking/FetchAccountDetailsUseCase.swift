//
//  FetchAccountDetailsUseCase.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 16/12/22.
//

import Foundation
import Network

protocol FetchAccountDetailsUseCaseProtocol {
    func fetchAccountDetails(id: String, forceRefresh: Bool, completion: @escaping (Result<[AccountDetailsResponse], NetworkError>) -> Void)
}

class FetchAccountDetailsUseCase: FetchAccountDetailsUseCaseProtocol {
    func fetchAccountDetails(id: String, forceRefresh: Bool, completion: @escaping (Result<[AccountDetailsResponse], NetworkError>) -> Void) {
        var urlSession: URLSession?
        let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(id)/accounts")!
        if !connectedToNetwork() || forceRefresh {
            urlSession = URLSession(configuration: .ephemeral)
        } else {
            urlSession = URLSession(configuration: .default)
        }
    
        urlSession?.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                let error: Error? = error
                print(error?.localizedDescription ?? "Error fetching data from URLSession")
                completion(.failure(.networkError))
                return
            }
            if let response: HTTPURLResponse = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let profile = try decoder.decode([AccountDetailsResponse].self, from: data)
                print(profile)
                completion(.success(profile))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
        }.resume()
        
    }
}
