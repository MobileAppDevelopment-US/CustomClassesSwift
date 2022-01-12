//
//  TintedImageView.swift
//
//  Created by Serik on 5/30/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TintedImageView: UIImageView {
    private let tintLayer = CALayer()
    
    @IBInspectable
    @objc dynamic var imageTintColor: UIColor? {
        didSet {
            self.applyImageTint(self.imageTintColor)
        }
    }
    override var bounds: CGRect {
        didSet {
            applyImageTint(imageTintColor)
        }
    }
    
    private func applyImageTint(_ color: UIColor?) {
        
        if let color = color {
            tintLayer.frame = bounds
            tintLayer.backgroundColor = color.withAlphaComponent(0.5).cgColor
            layer.insertSublayer(tintLayer, at: 0)
        } else {
            tintLayer.removeFromSuperlayer()
        }
    }
}

