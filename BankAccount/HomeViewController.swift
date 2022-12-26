//
//  HomeViewController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 25/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Models
    let viewModel = HomeViewModel()
    var homeHeaderProfile = HomeHeaderModel()
    var accountsList: [HomeAccountModel]?

    //MARK: - Tools
    let group = DispatchGroup()

    //MARK: - UI Components
    var headerView = HomeHeaderView(frame: .zero)
    lazy var stackView = UIStackView()
    lazy var logoutButton = UIBarButtonItem()
    lazy var tableView = UITableView()
    lazy var refreshControl = UIRefreshControl()
    
    //MARK: - Variables
    var isDataLoaded: Bool = false
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setSelfSetup()
        setSelfView()
        setupViews()
        self.fetchHomeData()
        self.setupRefreshControl()
    }
    
    //MARK: - View Setup
    private func setSelfSetup() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(tableView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
        
    private func setSelfView() {
        self.view.backgroundColor = .white
    }

    //MARK: - Setup Other UI Components
    private func setupViews() {
        setStackView()
        setLogoutButton()
        setupTableView()
        setupHeaderTableView()
        setupNavBar()
        setupHeaderProfile()
        setupSkeletons()
    }
    
    private func setStackView() {
        stackView.axis = .vertical
        stackView.spacing = 0
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setLogoutButton() {
//        logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(callLogout))
        logoutButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(callLogout))
    }
    
    private func setupSkeletons() {
        let row = AccountDetailsResponse.makeSkeleton()
        let skeletonAccountsList = Array(repeating: row, count: 10)
        
        configureTableViewAccounts(response: skeletonAccountsList)
//        configureTableCells(with: accountsList)
    }
    
    private func setupHeaderProfile() {
        self.homeHeaderProfile.welcomeMessage = "Welcome to the B.A. Bank."
        self.homeHeaderProfile.date = Date()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .secondaryGreen
        tableView.separatorColor = .primaryGreen

        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.reuseID)
        tableView.rowHeight = 90
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stackView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
    }
    
    private func setupHeaderTableView() {
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        tableView.tableHeaderView = headerView
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = logoutButton
        self.navigationController?.navigationBar.backgroundColor = .secondaryGreen
        self.navigationController?.navigationBar.tintColor = .primaryGreen
    }
    
    private func setupRefreshControl() {
        refreshControl.tintColor = .primaryGreen
        refreshControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    //MARK: - Methods - Actions
    @objc private func callLogout(sender: UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
    
    @objc private func refreshContent(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.fetchHomeData()
            self.tableView.refreshControl?.endRefreshing()
        })
    }
    
    //MARK: - Group UI Loading from Networking data
    private func fetchHomeData() {
        self.loadNetworkDataHeader()
        self.loadNetworkDataAccount()
        self.groupLoadingWithDispatchGroup()
    }
    
    private func groupLoadingWithDispatchGroup() {
        self.group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Load network data - Header
    private func loadNetworkDataHeader() {
        self.group.enter()
        self.viewModel.getAccountProfileData(completion: { response, error in
            guard let response = response else {
                print(error ?? "Error getting Account Profile Data")
                return
            }
            DispatchQueue.main.async {
                self.configureTableHeaderView(response: response)
                self.tableView.tableHeaderView = self.headerView
                self.group.leave()
                // reloadData() => chamada pelo dispatchGroup depois das informações já terem sido retornadas
            }
        })
    }
    
    private func configureTableHeaderView(response: AccountProfileResponse) {
        let accountHeaderModel = HomeHeaderModel(welcomeMessage: "Welcome to the B.A. Bank.", name: (response.firstName + " " + response.lastName), date: Date())
        self.headerView.setupHeaderMessages(model: accountHeaderModel)
    }
    
    //MARK: - Load network data - Accounts
    private func loadNetworkDataAccount() {
        self.group.enter()
        self.viewModel.getAccountsDetails { response, error in
            guard let response = response else {
                print(error ?? "Error getting Account Details Data")
                return
            }
            DispatchQueue.main.async {
                self.configureTableViewAccounts(response: response)
                self.group.leave()
                // reloadData() => chamada pelo dispatchGroup depois das informações já terem sido retornadas
            }
        }
    }
    
    private func configureTableViewAccounts(response: [AccountDetailsResponse]?) {
        self.accountsList = [HomeAccountModel]()
        let dollarFormatter = CurrencyFormatter()
        
        self.accountsList = response?.map({
            HomeAccountModel(accountType: $0.type,
                             accountName: ($0.name),
                             dollars: dollarFormatter.formatDollar(dollarsPart: $0.amount),
                             cents: dollarFormatter.formatCents(extractCentsFrom: $0.amount))
        })
    }
}

//MARK: - Extension - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let accounts = accountsList else {return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseID, for: indexPath) as! HomeCell
        cell.configure(response: accounts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountsList?.count ?? 0
    }
}

//MARK: - Extension - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row: \(indexPath.row)")
    }
}
