//
//  HomeHeaderView.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 05/11/22.
//

import UIKit

class HomeHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let notificationBellView = NotificationBellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: HomeHeaderView.self)
        bundle.loadNibNamed("HomeHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .secondaryGreen
        mainLabel.textColor = .primaryGreen
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        setupNotificationBellView()
        
    }
    
    private func setupNotificationBellView() {
        notificationBellView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(notificationBellView)
        
        NSLayoutConstraint.activate([
            notificationBellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            notificationBellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupHeaderMessages(model: HomeHeaderModel) {
        self.nameLabel.text = "Hello, " + model.name! + "."
        self.welcomeLabel.text = model.welcomeMessage
        self.dateLabel.text = "Today is " + model.dateFormatted + "."
    }
}
