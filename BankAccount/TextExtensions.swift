//
//  TextExtensions.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 21/11/22.
//

import UIKit


extension UILabel {
    func formatTitle() -> UILabel {
        self.font = UIFont.init(name: "American Typewriter", size: 40)
        self.textAlignment = .center
        self.textColor = .primaryGreen
        return self
    }
}

extension String {
    func getChar(index: Int) -> Character {
        let starIndex = self.startIndex
        let indexOffsetBy = self.index(starIndex, offsetBy: index)
        let character = self[indexOffsetBy]
        return character
    }
}
