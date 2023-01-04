//
//  HomeViewControllerTests.swift
//  BankAccountUnitTests
//
//  Created by Beltrami Dias Batista, Thiago on 02/01/23.
//

import Foundation
import XCTest

@testable import BankAccount

class HomeViewControllerTests: XCTestCase {
    var vc: HomeViewController!
    var mockProfileDataFetcher: MockProfileDataFetcher!
    
    class MockProfileDataFetcher: FetchAccountProfileUseCaseProtocol {
        var profile: AccountProfileResponse?
        var error: NetworkError?
        
        func fetchProfile(id userId: String, completion: @escaping (Result<AccountProfileResponse, NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            profile = AccountProfileResponse(id: "1", firstName: "FirstName", lastName: "LastName")
            completion(.success(profile!))
        }
    }
    
    override func setUp() {
        super.setUp()
        vc = HomeViewController()
        // vc.loadViewIfNeeded() // This will trigger a call to viewDidLoad()
        
        mockProfileDataFetcher = MockProfileDataFetcher()
        vc.viewModel.fetchAccountProfileUseCase = mockProfileDataFetcher
    }
    
    func testTitleAndMessageForFetchingAccountsServerError() throws {
        let titleAndMessage = vc.showErrorAlertForTesting(error: .networkError)
            XCTAssertEqual("Erro de conexão", titleAndMessage.0)
            XCTAssertEqual("Por favor, verifique sua conexão antes de prosseguir.", titleAndMessage.1)
    }
    
    func testTitleAndMessageForFetchingAccountsDecodingError() throws {
        let titleAndMessage = vc.showErrorAlertForTesting(error: .decodingError)
            XCTAssertEqual("Erro no servidor", titleAndMessage.0)
            XCTAssertEqual("Não foi possível processar sua solicitação. Por favor, tente novamente mais tarde.", titleAndMessage.1)
    }
    
    func testAlertForFetchingProfileServerError() throws {
        mockProfileDataFetcher.error = NetworkError.networkError
        vc.fetchDataHeaderForTesting()
        
        XCTAssertEqual("Erro de conexão", vc.errorAlert.title)
        XCTAssertEqual("Por favor, verifique sua conexão antes de prosseguir.", vc.errorAlert.message)
    }
    
    func testAlertForFetchingProfileDecodingError() throws {
        mockProfileDataFetcher.error = NetworkError.decodingError
        vc.fetchDataHeaderForTesting()
        
        XCTAssertEqual("Erro no servidor", vc.errorAlert.title)
        XCTAssertEqual("Não foi possível processar sua solicitação. Por favor, tente novamente mais tarde.", vc.errorAlert.message)
    }
}
