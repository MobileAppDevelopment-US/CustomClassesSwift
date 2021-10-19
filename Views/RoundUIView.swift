//
//  RoundUIView.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

class RoundUIView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            setLayer()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setLayer()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            setLayer()
        }
    }
    
    @IBInspectable var roundTop: Bool = true {
        didSet {
            setLayer()
        }
    }
    
    @IBInspectable var roundBottom: Bool = true {
        didSet {
            setLayer()
        }
    }
    
    override var bounds: CGRect{
        didSet{
           setLayer()
        }
    }
    
    
    private func setLayer() {
        if roundTop && roundBottom {
            self.layer.cornerRadius = cornerRadius
            self.layer.borderColor = borderColor?.cgColor
            self.layer.borderWidth = borderWidth
        } else {
            self.layer.cornerRadius = 0
            self.layer.borderColor = nil
            self.layer.borderWidth = 0
            var corners: UIRectCorner = []
            if roundTop {
                corners.insert(.topLeft)
                corners.insert(.topRight)
            }
            if roundBottom {
                corners.insert(.bottomLeft)
                corners.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            maskLayer.borderColor = borderColor?.cgColor
            maskLayer.borderWidth = borderWidth
            self.layer.mask = maskLayer
            self.layer.masksToBounds = true
        }
    }
}
