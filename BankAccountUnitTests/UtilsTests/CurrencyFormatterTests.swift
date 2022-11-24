//
//  CurrencyFormatterTests.swift
//  BankAccountUnitTests
//
//  Created by Beltrami Dias Batista, Thiago on 24/11/22.
//

import Foundation
import XCTest

@testable import BankAccount

class CurrencyFormatterTests: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testDollarsFormatted() throws {
        var result = formatter.formatDollar(dollarsPart: 900000.50)
        XCTAssertEqual(result, "900,000")
        result = formatter.formatDollar(dollarsPart: 9000000.50)
        XCTAssertEqual(result, "9,000,000")
        result = formatter.formatDollar(dollarsPart: 9000000000.50)
        XCTAssertEqual(result, "9,000,000,000")
        result = formatter.formatDollar(dollarsPart: 90000.50)
        XCTAssertEqual(result, "90,000")
        result = formatter.formatDollar(dollarsPart: 90000.44)
        XCTAssertEqual(result, "90,000")
        result = formatter.formatDollar(dollarsPart: 90000.5)
        XCTAssertEqual(result, "90,000")
        result = formatter.formatDollar(dollarsPart: 90000)
        XCTAssertEqual(result, "90,000")
        result = formatter.formatDollar(dollarsPart: -90000.50)
        XCTAssertEqual(result, "-90,000")
        result = formatter.formatDollar(dollarsPart: -90000)
        XCTAssertEqual(result, "-90,000")
        result = formatter.formatDollar(dollarsPart: -900000)
        XCTAssertEqual(result, "-900,000")
        result = formatter.formatDollar(dollarsPart: -900000000)
        XCTAssertEqual(result, "-900,000,000")
        result = formatter.formatDollar(dollarsPart: -9000000000)
        XCTAssertEqual(result, "-9,000,000,000")
        result = formatter.formatDollar(dollarsPart: 0)
        XCTAssertEqual(result, "0")
    }
    
}
