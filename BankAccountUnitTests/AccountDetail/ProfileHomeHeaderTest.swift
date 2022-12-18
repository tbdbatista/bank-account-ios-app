//
//  ProfileHomeHeaderTest.swift
//  BankAccountUnitTests
//
//  Created by Beltrami Dias Batista, Thiago on 18/12/22.
//

import Foundation
import XCTest

@testable import BankAccount

class ProfileHomeHeaderTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testIfCanParseAccountProfileResponse() throws {
        let incomeJson = """
                         {
                            "id": "1",
                            "first_name": "Thiago",
                            "last_name": "Batista",
                         }
                         """
        
        let data = incomeJson.data(using: .utf8)!
        let result = try! JSONDecoder().decode(AccountProfileResponse.self, from: data)
        
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.firstName, "Thiago")
        XCTAssertEqual(result.lastName, "Batista")
    }
}
