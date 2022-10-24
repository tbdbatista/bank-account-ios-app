//
//  OnboardingViewController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 24/10/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    let stackView = UIStackView()
    let imageView = UIImageView()
    let mainLabel = UILabel()
    
    let message: String?
    let imageName: String?
    let imageHeight: Float?
    let imageWidth: Float?
    

    init(withMessage: String, imageName: String, imageWidth: Float, imageHeight: Float) {
        self.message = withMessage
        self.imageName = imageName
        self.imageHeight = imageHeight
        self.imageWidth = imageWidth
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.imageView.image = UIImage(named: self.imageName ?? "")
        NSLayoutConstraint.activate([
            self.imageView.heightAnchor.constraint(equalToConstant: CGFloat(imageHeight ?? 10)),
            self.imageView.widthAnchor.constraint(equalToConstant: CGFloat(imageWidth ?? 10))
        ])
        
    }
    
    private func setMainLabel() {
        self.mainLabel.text = self.message
        self.mainLabel.numberOfLines = 0
        self.mainLabel.textAlignment = .center
        self.mainLabel.textColor = .primaryGreen
        self.mainLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
    }
    
}
