//
//  LoginView.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 21/10/22.
//

import UIKit

class LoginView: UIView {
    
    lazy var loginStackView = UIStackView()
    lazy var usernameTextField = UITextField()
    lazy var passwordTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Required - implement init(coder: - class LoginView)") // <<== used for storyboard mode
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height:   100) // <<== view size
    }
    
    //MARK: - View Setup
    private func style() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .yellow
        
        self.addSubview(loginStackView)
        self.loginStackView.addArrangedSubview(usernameTextField)
        self.loginStackView.addArrangedSubview(passwordTextField)
   
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func layout() {
        
    }
    
    //MARK: - Elements setup
    private func setViews() {
        setLoginStackView()
        setUsernameInputText()
        setPasswordInputText()
    }
    
    private func setLoginStackView() {
        self.loginStackView.axis = .vertical
        self.loginStackView.spacing = 16
        
        NSLayoutConstraint.activate([
            loginStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: loginStackView.trailingAnchor, multiplier: 2)
        ])
    }
    
    private func setUsernameInputText() {
        self.usernameTextField.placeholder = "Username"
        self.usernameTextField.delegate = self
    }
    
    private func setPasswordInputText() {
        self.passwordTextField.placeholder = "Password"
        self.passwordTextField.delegate = self
    }
}

//Mark: - Extensions
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        
  
        if !textField.hasText {
            textField.placeholder = "Type here your information"
            print("Inválid input - cannot be empty")
            return false } else {
                textField.resignFirstResponder()
                print("Valid input - \(textField.text!)")
            }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        if textField.text?.count ?? 0 < 5 {
            print("Inválid input - too short")
            return false
        } else {
            print("Valid input - more than 3 char")
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
}
