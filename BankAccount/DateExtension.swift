//
//  DateExtension.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 16/12/22.
//

import Foundation

extension Date {
    var monthDayYearString : String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "MDT")
        dateFormatter.dateFormat = "MM dd, YYYY"
        return dateFormatter.string(from: self)
    }
}
