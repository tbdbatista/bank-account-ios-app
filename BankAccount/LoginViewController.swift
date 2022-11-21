//
//  LoginViewController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 21/10/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginViewModel = LoginViewModel()
    
    lazy var logoLabel = UILabel()
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
        loginViewModel.delegate = self
        setSelfView()
        layout()
        setViews()
    }
    
    private func setViews() {
        self.setStackView()
        self.setSignInButton()
        self.setErrorWarningsLabel()
        self.setLogoLabel()
    }
    
    //MARK: - View Setup
    private func setSelfView() {
        self.view.backgroundColor = .secondaryGreen
    }
    
    private func layout() {
        view.addSubview(logoLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(loginView)
        stackView.addArrangedSubview(signInButton)
        view.addSubview(errorWarningsLabel)
        
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    //MARK: - Elements Setup
    
    private func setLogoLabel() {
        self.logoLabel.text = "B.A. Bank".uppercased()
        self.logoLabel = logoLabel.formatTitle()
        
        NSLayoutConstraint.activate([
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: logoLabel.bottomAnchor, multiplier: 6)
        ])
    }
    
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
        self.signInButton.backgroundColor = .primaryGreen
        self.signInButton.layer.cornerRadius = 5
        self.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    //MARK: - Actions
    @objc private func signInButtonTapped() {
        print("button tapped")
        self.callLogin()
        print("Actual state = \(String(describing: loginViewModel.getErrorWarningState()))")
    }
    
    //MARK: - Methods
    private func callLogin() {
        loginViewModel.login(username: username, password: password)
    }
    
    private func cleanInputs(wrongPassword: Bool = false) {
        if !wrongPassword {
            loginView.usernameTextField.text = ""
            loginView.usernameTextField.becomeFirstResponder()
        }
        loginView.passwordTextField.text = ""
    }
}

//MARK: - Extension - LoginViewlModelDelegate
extension LoginViewController: LoginViewModelDelegate {
    internal func didLogin() {
        NavigationLogin.goHome(presenter: self)
    }
    
    internal func setErrorWarningsLabel() {
        
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
            self.cleanInputs(wrongPassword: true)
        default :
            self.errorWarningsLabel.isHidden = true
            self.cleanInputs()
        }
        
        NSLayoutConstraint.activate([
            errorWarningsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorWarningsLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2)
        ])
        
    }
}

    //MARK: - Enums
    enum ErrorWarningState {
    case emptyLoginInput
    case incorrectLoginInput
}

