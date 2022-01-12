//
//  CustomFontLabel.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//
import UIKit

class UnderlineLabel: UILabel {
    var wasConfigured = false
    override func layoutSubviews() {
        let text = self.text
        let attributedString = NSMutableAttributedString.init(string: text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        if !wasConfigured {
            wasConfigured = true
            self.attributedText = attributedString
        }
    }
}
