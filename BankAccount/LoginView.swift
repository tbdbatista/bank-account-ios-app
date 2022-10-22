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
    lazy var dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSelfSetup()
        layout()
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Required - implement init(coder: - class LoginView)") // <<== used for storyboard mode
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 80) // <<== view size
    }
    
    //MARK: - Self Setup
    private func setSelfSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        
        self.addSubview(loginStackView)
        self.loginStackView.addArrangedSubview(usernameTextField)
        self.loginStackView.addArrangedSubview(dividerView)
        self.loginStackView.addArrangedSubview(passwordTextField)
   
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func layout() {
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.3
    }
    
    //MARK: - Elements setup
    private func setViews() {
        setLoginStackView()
        setUsernameInputText()
        setPasswordInputText()
        setDividerView()
    }
    
    private func setLoginStackView() {
        self.loginStackView.axis = .vertical
        self.loginStackView.spacing = 8
        
        NSLayoutConstraint.activate([
            loginStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: loginStackView.trailingAnchor, multiplier: 2)
        ])
    }
    
    private func setUsernameInputText() {
        self.usernameTextField.placeholder = " Username"
        self.usernameTextField.delegate = self
    }
    
    private func setPasswordInputText() {
        self.passwordTextField.placeholder = " Password"
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.delegate = self
    }
    
    private func setDividerView() {
        self.dividerView.backgroundColor = .secondarySystemFill
        self.dividerView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
}

//MARK: - Extensions
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")

//        usernameTextField.endEditing(true)
//        passwordTextField.endEditing(true)
        
        textField.resignFirstResponder()
//        if !textField.hasText {
//            textField.placeholder = "Type here your information"
//            print("Inválid input - cannot be empty")
//            return false } else {
//                print("Valid input - \(textField.text!)")
//            }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        if textField.text?.count ?? 0 < 5 {
            print("Inválid input - too short")
        } else {
            print("Valid input - more than 3 char")
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
}
