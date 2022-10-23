//
//  LoginViewController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 21/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    let loginViewModel = LoginViewModel()
    
    lazy var stackView = UIStackView()
    lazy var loginView = LoginView()
    lazy var signInButton = UIButton()
    lazy var errorWarningsLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelfView()
        layout()
        setViews()
    }
    
    private func setViews() {
        self.setStackView()
        self.setSignInButton()
        self.setErrorWarningsLabel()
    }
    
    //MARK: - View Setup
    private func setSelfView() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(loginView)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(errorWarningsLabel)
        
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    //MARK: - Elements Setup
    private func setStackView() {
        self.stackView.spacing = 16
        self.stackView.axis = .vertical
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
    
    private func setSignInButton() {
        self.signInButton.setTitle("Sign In", for: .normal)
        self.signInButton.backgroundColor = .systemBlue
        self.signInButton.layer.cornerRadius = 5
        self.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    private func setErrorWarningsLabel() {
        
        let errorWarningState = loginViewModel.getErrorWarningState()
        
        self.errorWarningsLabel.textColor = .systemRed
        self.errorWarningsLabel.textAlignment = .center
        self.errorWarningsLabel.numberOfLines = 0
        
        switch errorWarningState {
        case .emptyLoginInput :
            self.errorWarningsLabel.text = "Username and Password cannot be blank."
            self.errorWarningsLabel.isHidden = false
        case .incorrectLoginInput :
            self.errorWarningsLabel.text = "Incorret Username/Password."
            self.errorWarningsLabel.isHidden = false
        default :
            self.errorWarningsLabel.isHidden = true
        }
    }

    //MARK: - Actions
    @objc private func signInButtonTapped() {
        print("button tapped")
        self.callLogin()
        print("Actual state = \(String(describing: loginViewModel.getErrorWarningState()))")
    }
    
    //MARK: - Methods
    private func callLogin() {
        guard let username = self.username, let password = self.password else {
            assertionFailure("Username and password should not be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            loginViewModel.setErrorWarningState(with: .emptyLoginInput)
            setErrorWarningsLabel()
            return
        }
        
        if username == "Thiago" && password == "1234" {
            print("Login Successfully")
            loginViewModel.setErrorWarningState(with: nil)
            setErrorWarningsLabel()
        } else {
            print("Login Error")
            loginViewModel.setErrorWarningState(with: .incorrectLoginInput)
            setErrorWarningsLabel()
        }
        
    }
}

//MARK: - Enums
enum ErrorWarningState {
    case emptyLoginInput
    case incorrectLoginInput
}
