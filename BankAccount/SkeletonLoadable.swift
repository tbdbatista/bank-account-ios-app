//
//  SkeletonLoadable.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 22/12/22.
//

import Foundation
import QuartzCore
import UIKit

protocol SkeletonLoadable {}

extension SkeletonLoadable {
    func makeAnimationGroup(previousGroup: CAAnimationGroup? = nil) -> CAAnimationGroup {
        let duration: CFTimeInterval = 1.5
        
        let animationOne = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        animationOne.fromValue = UIColor.primaryGrayGradient.cgColor
        animationOne.toValue = UIColor.secondaryGrayGradient.cgColor
        animationOne.duration = duration
        animationOne.beginTime = 0.0
        
        let animationTwo = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        animationTwo.fromValue = UIColor.primaryGrayGradient.cgColor
        animationTwo.toValue = UIColor.secondaryGrayGradient.cgColor
        animationTwo.duration = duration
        animationTwo.beginTime = animationOne.beginTime + duration
        
        let group = CAAnimationGroup()
        group.animations = [animationOne, animationTwo]
        group.repeatCount = .greatestFiniteMagnitude
        group.duration = animationTwo.beginTime + duration
        group.isRemovedOnCompletion = false
        
        if let previousGroup = previousGroup {
            group.beginTime = previousGroup.beginTime + 0.33
        }
        
        return group
    }
}
