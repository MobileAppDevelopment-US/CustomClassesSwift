//
//  CustomFontLabel.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

class UnderlineCustomFontLabel: UILabel {
    var wasConfigured = false
    override func layoutSubviews() {
        
        if self.font.isBold{
            self.font = UIFont.init(name: CustomFont.bold, size: self.font.pointSize)
        } else {
            self.font = UIFont.init(name: CustomFont.regular, size: self.font.pointSize)
        }
        //super.layoutSubviews()
        
        let text = self.text
        let attributedString = NSMutableAttributedString.init(string: text ?? "")
        
        // Add Underline Style Attribute.
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        //  label.attributedText = attributedString
        if !wasConfigured {
            wasConfigured = true
            self.attributedText = attributedString
        }
    }
}

class CustomFontLabel: UILabel {
 
    override func layoutSubviews() {
        if self.font.isBold {
            self.font = UIFont.init(name: CustomFont.bold, size: self.font.pointSize)
        }
        else {
            self.font = UIFont.init(name: CustomFont.regular, size: self.font.pointSize)
        }
    }
    
}


 

