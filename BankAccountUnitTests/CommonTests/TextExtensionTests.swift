//
//  TextExtensionTests.swift
//  BankAccountUnitTests
//
//  Created by Beltrami Dias Batista, Thiago on 24/11/22.
//

import Foundation
import XCTest

@testable import BankAccount

class StringTest: XCTestCase {
    var string: String!
    
    override func setUp() {
        super.setUp()
        string = String()
    }
    
    func testReturnCharacterFromStringAtIndexPosition() throws {
        string = "testReturnCharacterFromStringAtIndexPosition"
        var character = string.getChar(index: 0)
        XCTAssertEqual(character, "t")
        character = string.getChar(index: 4)
        XCTAssertEqual(character, "R")
    }
}
