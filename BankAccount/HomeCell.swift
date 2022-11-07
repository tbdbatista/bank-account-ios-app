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
    
    static let reuseID = "HomeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSelfCell()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelfCell() {
        self.contentView.addSubview(firstStackView)
        firstStackView.addArrangedSubview(typeLabel)
        firstStackView.addArrangedSubview(underLineView)
        firstStackView.addArrangedSubview(nameLabel)
    }
    
    private func setupViews() {
        setupFirstStack()
        setupTypeLabel()
        setupUnderlineView()
        setupNameLabel()
    }
    
    private func setupFirstStack() {
        firstStackView.axis = .vertical
        firstStackView.spacing = 8
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            firstStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupTypeLabel() {
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.text = "Account type"
        typeLabel.textColor = .primaryGreen
    }
    
    private func setupUnderlineView() {
        underLineView.backgroundColor = .secondaryGreen
        underLineView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    private func setupNameLabel() {
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Account name"
        nameLabel.textColor = .primaryGreen
    }
}
