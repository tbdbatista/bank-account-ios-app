//
//  HomeViewController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 25/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeViewModel = HomeViewModel()
    let stackView = UIStackView()
    let mainLabel = UILabel()
    let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel.delegate = self
  
        setSelfSetup()
        setSelfView()
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeViewModel.callOnboarding()
    }
    
    private func setSelfSetup() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(logoutButton)
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
        
    private func setSelfView() {
        self.view.backgroundColor = .white
    }

    private func setViews() {
        setStackView()
        setMainLabel()
        setLogoutButton()
    }
    
    private func setStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setMainLabel() {
        mainLabel.text = "BA Bank"
        mainLabel.textColor = .primaryGreen
    }
    
    private func setLogoutButton() {
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .secondaryGreen
        logoutButton.setTitleColor(.primaryGreen, for: .normal)
        logoutButton.addTarget(self, action: #selector(callLogout), for: .touchUpInside)
    }
    
    //MARK: - Methods
    @objc private func callLogout(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - Extension - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func didHaveOnboarded() {
        NavigationLogin.goHome(presenter: self)
    }
    
    func didNotHaveOnboarded() {
        NavigationLogin.goOnboarding(presenter: self)
    }

}
