//
//  FetchAccountProfileUseCase.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 16/12/22.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

class FetchAccountProfileUseCase {
    func fetchProfile(id userId: String, completion: @escaping (Result<AccountProfileResponse, NetworkError>) -> Void) {
        let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userId)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            if let response : HTTPURLResponse = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            do {
                let profile = try JSONDecoder().decode(AccountProfileResponse.self, from: data)
                print(profile)
                completion(.success(profile))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
