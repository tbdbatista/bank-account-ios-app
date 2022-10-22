//
//  LoginViewController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 21/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    lazy var stackView = UIStackView()
    lazy var loginView = LoginView()
    lazy var signInButton = UIButton()
    lazy var warningsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelfView()
        layout()
        setViews()
    }
    
    private func setViews() {
        self.setStackView()
        self.setSignInButton()
        self.setWarningsLabel()
    }
    
    //MARK: - View Setup
    private func setSelfView() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(loginView)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(warningsLabel)
        
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
    
    private func setWarningsLabel() {
        if true {
            self.warningsLabel.isHidden = false
        }
        if false {
            self.warningsLabel.isHidden = true
        }
        
        self.warningsLabel.text = "Username and Password cannot be blank."
        self.warningsLabel.textColor = .systemRed
        self.warningsLabel.textAlignment = .center
    }

    //MARK: - Actions
    @objc private func signInButtonTapped() {
        print("button tapped")
    }
    
}

