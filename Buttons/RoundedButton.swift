//
//  RoundedButton.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedButton: CustomFontButton {
    
    @IBInspectable
    var cornerRadius2: CGFloat = 0 {
        didSet {
            setCornerRadius()
        }
    }
    
    @objc dynamic var textColor: UIColor? {
        didSet {
            self.setTextColor(textColor)
        }
    }
    
    @objc dynamic var imageColor: UIColor? {
        didSet {
            self.setImageColor(imageColor)
        }
    }
    
    override func layoutSubviews() {
        
        self.contentEdgeInsets = UIEdgeInsets(top: 16, left: self.contentEdgeInsets.left,
                                              bottom: 16, right: self.contentEdgeInsets.right)
        super.layoutSubviews()
        
    }
    
    private func setCornerRadius() {
        
        layer.cornerRadius = cornerRadius2
        
    }
    
    private func setTextColor(_ color: UIColor?) {
        self.setTitleColor(color, for: .normal)
    }
    
    private func setImageColor(_ color: UIColor?) {
        if let color = color {
            self.setImage(self.image(for: .normal)?.withRenderingMode(.alwaysTemplate), for: .normal)
            self.tintColor = color
        } else {
            self.setImage(self.image(for: .normal)?.withRenderingMode(.alwaysOriginal), for: .normal)
            self.tintColor = color
        }
    }
}
