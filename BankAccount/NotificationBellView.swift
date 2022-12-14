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
        for x in 0...3 {
            perform(#selector(defaultBellShake), with: .none, afterDelay: Double(x))
        }
    }
    
    @objc private func defaultBellShake() {
        shakeWith(duration: 1, angle: .pi/8, yOffset: 0.0)
    }
    
    // MARK: - Animation
    private func shakeWith(duration: Double, angle: CGFloat, yOffset: CGFloat) {
        let numberOfFrames: Double = 6
        let frameDuration = Double(1/numberOfFrames)
        
        bellView.setAnchorPoint(CGPoint(x: 0.5, y: yOffset))
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [],
                                animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: frameDuration) {
                self.bellView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration,
                               relativeDuration: frameDuration) {
                self.bellView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*2,
                               relativeDuration: frameDuration) {
                self.bellView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*3,
                               relativeDuration: frameDuration) {
                self.bellView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*4,
                               relativeDuration: frameDuration) {
                self.bellView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*5,
                               relativeDuration: frameDuration) {
                self.bellView.transform = CGAffineTransform.identity
            }
        })
    }
}

