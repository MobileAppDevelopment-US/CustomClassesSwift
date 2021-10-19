//
//  CustomFontButton.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import Foundation
import UIKit

class CustomFontButton: UIButton {
    
    override func layoutSubviews() {
        if let titleLabel = self.titleLabel {
            if titleLabel.font.isBold{
                titleLabel.font = UIFont.init(name: CustomFont.bold, size: titleLabel.font.pointSize)!
            }
            else {
                titleLabel.font = UIFont.init(name: CustomFont.regular, size: titleLabel.font.pointSize)!
            }
            self.setTitle(self.titleLabel?.text, for: .normal)
        }
        super.layoutSubviews()
    }
    
}
