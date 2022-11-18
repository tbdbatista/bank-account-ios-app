//
//  BankAccountUnitTests.swift
//  BankAccountUnitTests
//
//  Created by Beltrami Dias Batista, Thiago on 18/11/22.
//

import XCTest
@testable import BankAccount

class BankAccountUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: 900000.50), "900,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: 9000000.50), "9,000,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: 9000000000.50), "9,000,000,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: 90000.50), "90,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: 90000.44), "90,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: 90000.5), "90,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: 90000), "90,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: -90000.50), "-90,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: -90000), "-90,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: -900000), "-900,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: -900000000), "-900,000,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: -9000000000), "-9,000,000,000")
        XCTAssertEqual(CurrencyFormatter().formatDollar(dollarsPart: 0), "0")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
