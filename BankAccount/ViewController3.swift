//
//  ViewController3.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 24/10/22.
//

import UIKit

class ViewController3: UIViewController {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let mainLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setSelfView()
        setViews()
    }
    
    func setSelfView() {
        view.backgroundColor = .secondaryGreen
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
        self.imageView.image = UIImage(named: "fast3.svg")
        NSLayoutConstraint.activate([
            self.imageView.heightAnchor.constraint(equalToConstant: 100),
            self.imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    private func setMainLabel() {
        self.mainLabel.text = "Some features you must need to know about our app"
        self.mainLabel.numberOfLines = 0
        self.mainLabel.textAlignment = .center
        self.mainLabel.textColor = .primaryGreen
        self.mainLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
    }
    
}
