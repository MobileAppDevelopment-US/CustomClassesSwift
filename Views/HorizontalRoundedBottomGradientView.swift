//
//  HorizontalRoundedBottomGradientView.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

@IBDesignable
class HorizontalRoundedBottomGradientView: RoundUIView { 
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
        let rect = self.bounds
        
        if let leftGradientColor = leftGradientColor,
            let rightGradientColor = rightGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [leftGradientColor.cgColor, rightGradientColor.cgColor]
            gradientLayer.startPoint =  CGPoint(x:startPoint, y: 0.5)
            gradientLayer.endPoint =  CGPoint(x:endPoint, y: 0.5)
            gradientLayer.borderColor = layer.borderColor
             
            
            layer.insertSublayer(gradientLayer, at: 0)
            
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners:[  .bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius2, height: cornerRadius2))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = rect
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
            self.layer.masksToBounds = true
            
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
    
}
