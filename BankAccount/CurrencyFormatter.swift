//
//  CurrencyFormatter.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 18/11/22.
//

import Foundation

class CurrencyFormatter {
    
    func formatDollar(dollarsPart: Double) -> String {
        let dollarsInt = Int(dollarsPart)
        var dollarsString = String(dollarsInt)
        var dollarsReversedString = String(dollarsString.reversed())
        var commasQuantity = 0
        
        for n in 0...dollarsReversedString.count - 1 {
            // checks if n is first index, and if n contains "-" as in a negative number
            if n%3 == 0, n != 0, dollarsReversedString[dollarsReversedString.index(dollarsReversedString.startIndex, offsetBy: n + commasQuantity)] != "-" {
                let i = dollarsReversedString.index(dollarsReversedString.startIndex, offsetBy: n + commasQuantity)
                dollarsReversedString.insert(",", at: i)
                commasQuantity += 1
            }
        }
        dollarsString = String(dollarsReversedString.reversed())
        return dollarsString
    }
    
    func formatCents(extractCentsFrom amount: Double) -> String {
        var cents: String = "00"
        var doubleCents: Double = 0.0
        
        switch amount {
        case _ where amount < 0.0 :
            doubleCents *= -1
        case 0.0 :
            return "00"
        default:
            doubleCents = amount
        }
        
        cents = String(Int(amount*100))
        let formattedCents = cents.suffix(2)

        return String(formattedCents)
    }
}
