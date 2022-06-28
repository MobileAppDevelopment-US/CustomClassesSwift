//
//  RoundedTopWithBorderView.swift
//
//  Created by Serik on 5/30/20.
//  Copyright © 2020 Serik. All rights reserved.
//


import Foundation

import UIKit

@IBDesignable
class RadialGradientView: RoundUIView {
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var innerGradientColor: UIColor? {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var outerGradientColor: UIColor? {
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
    @IBInspectable
    var cornerRadius2: CGFloat = 0 {
        didSet {
            setGradient()
        }
    }
    override var cornerRadius: CGFloat {
        didSet {
            setGradient()
        }
    }
    private func setGradient() {
        if let innerGradientColor = innerGradientColor, let outerGradientColor = outerGradientColor {
            gradientLayer.type = .radial
            gradientLayer.frame = bounds
            gradientLayer.colors = [innerGradientColor.cgColor, outerGradientColor.cgColor]
            gradientLayer.locations = [NSNumber(value: Float(startPoint)), NSNumber(value: Float(endPoint))]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.borderColor = layer.borderColor
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}
