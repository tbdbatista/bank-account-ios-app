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
    
    var logoLeadingAnchor: NSLayoutConstraint?
    
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
        registerForNotificationsToLogout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startLogoVerticalAnimation()
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
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: logoLabel.bottomAnchor, multiplier: 6)
        ])
        logoLeadingAnchor = logoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1000)
        logoLeadingAnchor?.isActive = true
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
    
    //MARK: - Animations
    private func startLogoVerticalAnimation() {
        let logoAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut, animations: {
            self.logoLeadingAnchor?.isActive = false
            self.logoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.view.layoutIfNeeded()
        })
        logoAnimator.startAnimation()
    }
    
    private func shakeButtonAnimation() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, 0, -10, 0, 10, 0, -10, 0]
        animation.keyTimes = [0, 0.15, 0.35, 0.45, 0.55, 0.65, 0.85, 0.95, 1.0]
        animation.duration = 0.4
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "shake")
        
    }

    //MARK: - Actions
    @objc private func signInButtonTapped() {
        print("button tapped")
        self.callLogin()
        print("Actual state = \(String(describing: loginViewModel.getErrorWarningState()))")
    }
    
    @objc private func callingLogout() {
        dismiss(animated: true, completion: nil)
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
    
    //MARK: - Notification Center Register
    private func registerForNotificationsToLogout() {
        NotificationCenter.default.addObserver(self, selector: #selector(callingLogout), name: .logout, object: nil)
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
            self.errorWarningsLabel.text = "Username and Password cannot be blank"
            self.errorWarningsLabel.isHidden = false
            self.shakeButtonAnimation()
        case .incorrectLoginInput :
            self.errorWarningsLabel.text = "Incorret Username/Password"
            self.errorWarningsLabel.isHidden = false
            self.shakeButtonAnimation()
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

