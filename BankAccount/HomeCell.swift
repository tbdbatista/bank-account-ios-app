//
//  HomeCell.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 07/11/22.
//

import UIKit

class HomeCell: UITableViewCell {
    
    lazy var firstStackView = UIStackView()
    lazy var typeLabel = UILabel()
    lazy var underLineView = UIView()
    lazy var nameLabel = UILabel()
    
    lazy var secondStackView = UIStackView()
    lazy var balanceLabel = UILabel()
    lazy var balanceAmountLabel = UILabel()
    lazy var chevronImageView = UIImageView()
    
    static let reuseID = "HomeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSelfCell()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Self Cell
    private func setupSelfCell() {
        self.contentView.addSubview(firstStackView)
        firstStackView.addArrangedSubview(typeLabel)
        firstStackView.addArrangedSubview(underLineView)
        firstStackView.addArrangedSubview(nameLabel)
        
        self.contentView.addSubview(secondStackView)
        secondStackView.addArrangedSubview(balanceLabel)
        secondStackView.addArrangedSubview(balanceAmountLabel)
        
        self.contentView.addSubview(chevronImageView)
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        setupFirstStackView()
        setupTypeLabel()
        setupUnderlineView()
        setupNameLabel()
        setupSecondStackView()
        setupBalanceLabel()
        setupBalanceAmountLabel()
        setupChevronImageView()
    }
    
    private func setupFirstStackView() {
        firstStackView.axis = .vertical
        firstStackView.spacing = 4
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            firstStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupTypeLabel() {
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.text = "Individual account"
        typeLabel.textColor = .primaryGreen
    }
    
    private func setupUnderlineView() {
        underLineView.backgroundColor = .secondaryGreen
        underLineView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    private func setupNameLabel() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Cryptocurrency"
        nameLabel.textColor = .primaryGreen
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 62).isActive = true
    }
    
    private func setupSecondStackView() {
        secondStackView.axis = .vertical
        secondStackView.spacing = 6
        secondStackView.alignment = .trailing
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: underLineView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: secondStackView.trailingAnchor, constant: 32)
        ])
    }
    
    private func setupBalanceLabel() {
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.text = "Cash balance"
        balanceLabel.textColor = .primaryGreen
    }
    
    private func setupBalanceAmountLabel() {
        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceAmountLabel.text = "$8,890.34"
        balanceAmountLabel.textColor = .primaryGreen
    }
    
    private func setupChevronImageView() {
        chevronImageView.image = UIImage(systemName: "chevron.right")?.withTintColor(.primaryGreen, renderingMode: .alwaysOriginal)
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            chevronImageView.topAnchor.constraint(equalTo: underLineView.bottomAnchor, constant: 16)
        ])
    }
}
