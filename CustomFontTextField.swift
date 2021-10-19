//
//  CustomFontTextField.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

class CustomFontTextField: UITextField {
    override func layoutSubviews() {
        if let font = self.font {
            if font.isBold { 
                self.font = UIFont.init(name: CustomFont.bold, size: font.pointSize)
            } else {
                self.font = UIFont.init(name: CustomFont.regular, size: font.pointSize)
            }
        }
        super.layoutSubviews()
    }
}
