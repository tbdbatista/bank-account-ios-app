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
    let games = ["Pacman", "Space Invaders", "Space Patrol","Pacman", "Space Invaders", "Space Patrol","Pacman", "Space Invaders", "Space Patrol","Pacman", "Space Invaders", "Space Patrol"]
    var tableView = UITableView()
    
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
        stackView.addArrangedSubview(tableView)
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(logoutButton)
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        self.navigationController?.isNavigationBarHidden = true
    }
        
    private func setSelfView() {
        self.view.backgroundColor = .white
    }

    private func setViews() {
        setStackView()
        setMainLabel()
        setLogoutButton()
        setupTableView()
        setupHeaderTableView()
    }
    
    private func setStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setMainLabel() {
        mainLabel.text = "BA Bank"
        mainLabel.textColor = .primaryGreen
        mainLabel.textAlignment = .center
    }
    
    private func setLogoutButton() {
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .secondaryGreen
        logoutButton.setTitleColor(.primaryGreen, for: .normal)
        logoutButton.addTarget(self, action: #selector(callLogout), for: .touchUpInside)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stackView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
    }
    
    private func setupHeaderTableView() {
        let header = HomeHeaderView(frame: .zero)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        tableView.tableHeaderView = header
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

//MARK: - Extension - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
}

//MARK: - Extension - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row: \(indexPath.row)")
    }
}
