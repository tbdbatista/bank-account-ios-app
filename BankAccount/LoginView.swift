//
//  LoginView.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 21/10/22.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Required - implement init(coder: - class LoginView)") // <<== used for storyboard mode
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height:   200) // <<== view size
    }
    
    //MARK: - View Setup
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        
    }
}
