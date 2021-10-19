//
//  TopBottomRoundedView.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

@IBDesignable

class TopBottomRoundedView: UIView {
    
    let gradientLayer = CAGradientLayer()
        
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
    
    @IBInspectable
    var topCornerRadiusEnabled: Bool = false {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var bottomCornerRadiusEnabled: Bool = false {
        didSet {
            setGradient()
        }
    }
     
    private func setGradient() {
        let rect = self.bounds
        layer.cornerRadius = 0
        
        layer.insertSublayer(gradientLayer, at: 0)
        let path:UIBezierPath
        if topCornerRadiusEnabled && bottomCornerRadiusEnabled {
            path = UIBezierPath(roundedRect: rect, byRoundingCorners:[  .topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius2, height: cornerRadius2))
        } else if topCornerRadiusEnabled {
            path = UIBezierPath(roundedRect: rect, byRoundingCorners:[  .topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius2, height: cornerRadius2))
        } else if bottomCornerRadiusEnabled {
            path = UIBezierPath(roundedRect: rect, byRoundingCorners:[.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius2, height: cornerRadius2))
        }    else{
            path = UIBezierPath(roundedRect: rect, byRoundingCorners:[  .topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 0, height: 0))
        }
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        self.layer.masksToBounds = true
    }
    
}
