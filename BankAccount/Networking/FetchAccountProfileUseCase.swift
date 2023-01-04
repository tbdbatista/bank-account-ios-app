//
//  FetchAccountProfileUseCase.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 16/12/22.
//

import Foundation

enum NetworkError: String, Error {
    case networkError
    case decodingError
    
    var description: [String] {
            switch self {
            case .networkError:
                return ["Erro de conexão", "Por favor, verifique sua conexão antes de prosseguir."]
            case .decodingError:
                return ["Erro no servidor", "Não foi possível processar sua solicitação. Por favor, tente novamente mais tarde."]
            }
        }
}

protocol FetchAccountProfileUseCaseProtocol {
    func fetchProfile(id userId: String, completion: @escaping (Result<AccountProfileResponse, NetworkError>) -> Void)
}

class FetchAccountProfileUseCase: FetchAccountProfileUseCaseProtocol {
    func fetchProfile(id userId: String, completion: @escaping (Result<AccountProfileResponse, NetworkError>) -> Void) {
        var url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userId)")!
        url.removeAllCachedResourceValues()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.networkError))
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
