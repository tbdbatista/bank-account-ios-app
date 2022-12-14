//
//  ImageViewExtensions.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 14/12/22.
//

import UIKit

extension UIView {
    
    //MARK: - Corrige o problema de deslocamento da imagem quando o anchor point != 0.5
    func setAnchorPoint(_ anchorPoint: CGPoint) {

        var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x,
                               y: self.bounds.size.height * anchorPoint.y)


        var oldPoint = CGPoint(x: self.bounds.size.width * self.layer.anchorPoint.x,
                               y: self.bounds.size.height * self.layer.anchorPoint.y)

        newPoint = newPoint.applying(self.transform)
        oldPoint = oldPoint.applying(self.transform)

        var position = self.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        self.layer.position = position
        self.layer.anchorPoint = anchorPoint
    }
}
