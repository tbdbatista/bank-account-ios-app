//
//  DecimalExtension.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 17/12/22.
//

import Foundation

extension Decimal {
    var formattedAmount: String? {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: self as NSDecimalNumber)
    }
}
