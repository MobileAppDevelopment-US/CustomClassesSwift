//
//  HorizontalGradientButton.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class HorizontalGradientButton: RoundedButton {
    
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var leftGradientColor: UIColor? {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var rightGradientColor: UIColor? {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var startPoint: CGFloat = 0 {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var endPoint: CGFloat = 1 {
        didSet {
            setGradient()
        }
    }
    
    override var bounds: CGRect{
        didSet{
            setGradient()
        }
    }
    
    override var cornerRadius2: CGFloat {
        didSet {
            setGradient()
        }
    }
    
    private func setGradient() {
                if let leftGradientColor = leftGradientColor,
                    let rightGradientColor = rightGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [leftGradientColor.cgColor, rightGradientColor.cgColor]
            gradientLayer.startPoint =  CGPoint(x:startPoint, y: 0.5)
            gradientLayer.endPoint =  CGPoint(x:endPoint, y: 0.5)
//            gradientLayer.borderColor = layer.borderColor
            self.layer.masksToBounds = true
            self.layer.insertSublayer(gradientLayer, at: 0)
            
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}

