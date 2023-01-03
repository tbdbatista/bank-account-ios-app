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
    
    override func setUp() {
        super.setUp()
        vc = HomeViewController()
//        vc.loadViewIfNeeded() // This will trigger a call to viewDidLoad()
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.showErrorAlertForTesting(error: .serverError)
            XCTAssertEqual("Erro de conexão", titleAndMessage.0)
            XCTAssertEqual("Por favor, verifique sua conexão antes de prosseguir.", titleAndMessage.1)
    }
    
    func testTitleAndMessageForDecodingError() throws {
        let titleAndMessage = vc.showErrorAlertForTesting(error: .decodingError)
            XCTAssertEqual("Erro no servidor", titleAndMessage.0)
            XCTAssertEqual("Não foi possível processar sua solicitação. Por favor, tente novamente mais tarde.", titleAndMessage.1)
    }
}
