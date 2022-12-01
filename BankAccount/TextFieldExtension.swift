//
//  TextFieldExtension.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 01/12/22.
//

import Foundation
import UIKit

let showPasswordToggleButton = UIButton(type: .custom)

extension UITextField {
    
    func enableToggleShowPassword() {
        
        let eyeFill = UIImage(systemName: "eye.fill")?.withTintColor(.primaryGreen, renderingMode: .alwaysOriginal)
        let eyeSlashFill = UIImage(systemName: "eye.slash.fill")?.withTintColor(.primaryGreen, renderingMode: .alwaysOriginal)
        showPasswordToggleButton.setImage(eyeFill, for: .normal)
        showPasswordToggleButton.setImage(eyeSlashFill, for: .selected)
        showPasswordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = showPasswordToggleButton
        rightViewMode = .always
    }
    
    @objc func togglePasswordView() {
        isSecureTextEntry.toggle()
        showPasswordToggleButton.isSelected.toggle()
    }
    
}
