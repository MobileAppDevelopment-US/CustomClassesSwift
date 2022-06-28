//
//  UnderlineCustomFontButton.swift
//  TorBrowser
//
//  Created by Serik on 02.02.2022.
//  Copyright © 2022 Guardian Project. All rights reserved.
//

import UIKit

class UnderlineCustomFontButton: UIButton {
    
    var wasConfigured = false
    override func layoutSubviews() {
        
        if let titleLabel = self.titleLabel {
            if titleLabel.font.isBold{
                titleLabel.font = UIFont.init(name: CustomFont.bold, size: titleLabel.font.pointSize)!
            } else {
                titleLabel.font = UIFont.init(name: CustomFont.regular, size: titleLabel.font.pointSize)!
            }
            
            let text = titleLabel.text
            let attributedString = NSMutableAttributedString.init(string: text ?? "")
            
            // Add Underline Style Attribute.
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
                                            NSRange.init(location: 0, length: attributedString.length));
            if !wasConfigured {
                wasConfigured = true
                self.setAttributedTitle(attributedString, for: .normal)
            }
        }
        super.layoutSubviews()
    }
    
}
