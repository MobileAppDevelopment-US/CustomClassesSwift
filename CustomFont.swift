//
//  CustomFont.swift
//
//  Created by Serik on 5/27/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

class CustomFont {
    static let regular: String  = "SFProDisplay-Regular"
    static let semiBold: String = "SFProDisplay-Semibold"
    static let bold: String     = "SFProDisplay-Bold"
}

extension UIFont {
    
    var isBold: Bool {
        return self.fontDescriptor.symbolicTraits.contains(.traitBold)
    }
}

