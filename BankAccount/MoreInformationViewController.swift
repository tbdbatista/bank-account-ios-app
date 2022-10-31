//
//  MoreInformationViewController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 28/10/22.
//

import UIKit

class MoreInformationViewController: UIViewController {
    let stackView = UIStackView()
    let mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfView()
        setupStackView()
        setupMainLabelView()
    }
    
    private func setupSelfView() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(mainLabel)
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupStackView() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupMainLabelView() {
        mainLabel.text = "Main Label"
        mainLabel.font = UIFont(name: "Times", size: 30)
        mainLabel.textAlignment = .center
    }
}

