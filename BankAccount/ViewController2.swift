//
//  ViewController2.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 24/10/22.
//

import UIKit

class ViewController2: UIViewController {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let mainLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setSelfView()
        setViews()
    }
    
    func setSelfView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(mainLabel)
        
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setViews() {
        setStackView()
        setImageView()
        setMainLabel()
    }
    
    private func setStackView() {
        self.stackView.axis = .vertical
        self.stackView.alignment = .center
        self.stackView.spacing = 32
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
    
    private func setImageView() {
        self.imageView.image = UIImage(named: "fast2.svg")
        NSLayoutConstraint.activate([
            self.imageView.heightAnchor.constraint(equalToConstant: 100),
            self.imageView.widthAnchor.constraint(equalToConstant: 140)
        ])
        
    }
    
    private func setMainLabel() {
        self.mainLabel.text = "With the B.A. you don't have to run to the nearest branch, because it's in the palm of your hand."
        self.mainLabel.numberOfLines = 0
        self.mainLabel.textAlignment = .center
        self.mainLabel.textColor = .primaryGreen
        self.mainLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
    }
    
}
