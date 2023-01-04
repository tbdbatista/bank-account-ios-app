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

    //MARK: - UI Components
    var headerView = HomeHeaderView(frame: .zero)
    lazy var stackView = UIStackView()
    lazy var logoutButton = UIBarButtonItem()
    lazy var tableView = UITableView()
    lazy var refreshControl = UIRefreshControl()
    lazy var errorAlert: UIAlertController = {
        let alert =  UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }()
    
    //MARK: - Variables
    var isDataLoaded: Bool = false
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setSelfSetup()
        setSelfView()
        setupViews()
        self.fetchHomeData(forceRefresh: false)
        self.setupRefreshControl()
        self.registerForNotificationsToCheckCallServiceOnDismissOnboarding()
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
        tableView.register(SkeletonCell.self, forCellReuseIdentifier: SkeletonCell.reuseID)
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
    
    private func resetDetails() {
        accountsList = []
        isDataLoaded = false
    }
    
    //MARK: - Methods - Actions
    @objc private func callLogout(sender: UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
    
    @objc private func refreshContent(sender: UIRefreshControl) {
        resetDetails()
        setupSkeletons()
        tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.fetchHomeData(forceRefresh: true)
        })
    }
    
    @objc private func callingDismissOnboarding() {
        dismiss(animated: true, completion: nil)
        resetDetails()
        setupSkeletons()
        tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.fetchHomeData(forceRefresh: false)
        })
    }
    
    //MARK: - Notification Center Register
    private func registerForNotificationsToCheckCallServiceOnDismissOnboarding() {
        NotificationCenter.default.addObserver(self, selector: #selector(callingDismissOnboarding), name: .closeOnboarding, object: nil)
    }
    
    //MARK: - Group UI Loading from Networking data
    private func fetchHomeData(forceRefresh: Bool) {
        self.loadNetworkDataHeader()
        self.loadNetworkDataAccount(forceRefresh: forceRefresh)
    }

    
    //MARK: - Load network data - Header
    private func loadNetworkDataHeader() {
        self.viewModel.getAccountProfileData(completion: { response, error in
            guard let response = response else {
                DispatchQueue.main.async {
                    self.showErrorAlert(error: error!)
                }
                print(error ?? "Error getting Account Profile Data")
                return
            }
            DispatchQueue.main.async {
                self.configureTableHeaderView(response: response)
                self.tableView.tableHeaderView = self.headerView
            }
        })
    }
    
    private func configureTableHeaderView(response: AccountProfileResponse) {
        let accountHeaderModel = HomeHeaderModel(welcomeMessage: "Welcome to the B.A. Bank.", name: (response.firstName + " " + response.lastName), date: Date())
        self.headerView.setupHeaderMessages(model: accountHeaderModel)
    }
    
    //MARK: - Load network data - Accounts
    private func loadNetworkDataAccount(forceRefresh: Bool) {
        self.viewModel.getAccountsDetails(forceRefresh: forceRefresh) { response, error in
            guard let response = response else {
                DispatchQueue.main.async {
                    self.showErrorAlert(error: error!)
                    self.tableView.refreshControl?.endRefreshing()
                }
                print(error ?? "Error getting Account Details Data")
                return
            }
            DispatchQueue.main.async {
                self.configureTableViewAccounts(response: response)
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
                self.isDataLoaded = true
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
    //MARK: - Handling errors
    private func parseTitleAndMessageForError(error: NetworkError) -> (String, String){
        let title: String
        let message: String
        switch error {
        case .networkError:
            title = error.description[0]
            message = error.description[1]
        case .decodingError:
            title = error.description[0]
            message = error.description[1]
        }
        return (title, message)
    }
    
    private func showErrorAlert(error: NetworkError) {
        let titleAndMessage = parseTitleAndMessageForError(error: error)
        errorAlert.title = titleAndMessage.0
        errorAlert.message = titleAndMessage.1
        
        present(errorAlert, animated: true, completion: nil)
    }
}

//MARK: - Extension - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let accounts = accountsList else {return UITableViewCell()}
        
        if isDataLoaded {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseID, for: indexPath) as! HomeCell
            cell.configure(response: accounts[indexPath.row])
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonCell.reuseID, for: indexPath) as! SkeletonCell
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

//MARK: - Extension - Unit Testing
extension HomeViewController {
    func showErrorAlertForTesting(error: NetworkError) -> (String, String){
        return parseTitleAndMessageForError(error: error)
    }
    
    func fetchDataHeaderForTesting() {
        self.viewModel.getAccountProfileData(completion: { response, error in
            guard let response = response else {
                self.showErrorAlert(error: error!)
                return
            }
                self.configureTableHeaderView(response: response)
                self.tableView.tableHeaderView = self.headerView
        })
    }
}
