//
//  NotificationBellView.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 14/12/22.
//

import Foundation
import UIKit

class NotificationBellView: UIView {
    
    let bellView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSelfView()
        self.setupSelfViewGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 48, height: 48)
    }

    private func setupSelfView() {
        translatesAutoresizingMaskIntoConstraints = false
        bellView.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(systemName: "bell.fill")!.withTintColor(.primaryGreen, renderingMode: .alwaysOriginal)
        bellView.image = image
        
        addSubview(bellView)
        
        NSLayoutConstraint.activate([
            bellView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bellView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bellView.heightAnchor.constraint(equalToConstant: 24),
            bellView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupSelfViewGesture() {
        bellView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBellImage)))
        bellView.isUserInteractionEnabled = true
    }
    
    @objc private func didTapBellImage() {
        print("shake it babe")
    }
}
