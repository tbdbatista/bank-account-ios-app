//
//  HomeHeaderResponse.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 15/12/22.
//

import Foundation

struct HomeHeaderResponse: Codable {
    let welcomeMessage: String
    let name: String
    let date: Date
    
    var dateFormatted: String {
        return date.monthDayYearString
    }
}
