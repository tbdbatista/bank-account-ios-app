//
//  AccountDetailsTest.swift
//  BankAccountUnitTests
//
//  Created by Beltrami Dias Batista, Thiago on 18/12/22.
//

import Foundation
import XCTest

@testable import BankAccount

class AccountDetailsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testIfCanParseAccountetailsResponse() throws {
        let incomeJson = """
         [
           {
             "id": "1",
             "type": "Banking",
             "name": "Basic Savings",
             "amount": 929466.23,
             "createdDateTime" : "2010-06-21T15:29:32Z"
           },
           {
             "id": "2",
             "type": "Banking",
             "name": "No-Fee All-In Chequing",
             "amount": 17562.44,
             "createdDateTime" : "2011-06-21T15:29:32Z"
           },
          ]
        """
        
        let data = incomeJson.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let result = try decoder.decode([AccountDetailsResponse].self, from: data)
        
        XCTAssertEqual(result[0].id, "1")
        XCTAssertEqual(result[0].name, "Basic Savings")
        XCTAssertEqual(result[0].type, .Banking)
        XCTAssertEqual(result[0].amount, 929466.23)
        XCTAssertEqual(result[0].createdDateTime.monthDayYearString, "Jun 21, 2010")
        
        XCTAssertEqual(result[1].id, "2")
        XCTAssertEqual(result[1].name, "No-Fee All-In Chequing")
        XCTAssertEqual(result[1].type, .Banking)
        XCTAssertEqual(result[1].amount, 17562.44)
        XCTAssertEqual(result[1].createdDateTime.monthDayYearString, "Jun 21, 2011")
        
        XCTAssertEqual(result.count, 2)
    }
}
