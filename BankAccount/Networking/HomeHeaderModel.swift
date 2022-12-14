//
//  HomeHeaderModel.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 15/12/22.
//

import Foundation

struct HomeHeaderModel {
    var welcomeMessage: String?
    var name: String?
    var date: Date?
    
    var dateFormatted: String {
        return date!.monthDayYearString
    }
}
