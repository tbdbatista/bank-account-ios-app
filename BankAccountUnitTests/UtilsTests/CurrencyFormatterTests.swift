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
        XCTAssertEqual(formatter.formatDollar(dollarsPart: 900000.50), "900,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: 9000000.50), "9,000,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: 9000000000.50), "9,000,000,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: 90000.50), "90,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: 90000.44), "90,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: 90000.5), "90,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: 90000), "90,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: -90000.50), "-90,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: -90000), "-90,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: -900000), "-900,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: -900000000), "-900,000,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: -9000000000), "-9,000,000,000")
        XCTAssertEqual(formatter.formatDollar(dollarsPart: 0), "0")
    }
    
}
