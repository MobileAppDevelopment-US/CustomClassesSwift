//
//  UIFont_Ext.swift
//
//  Created by Serik on 03/10/22.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

extension UIFont {
    public static func sfProDisplayFont(ofSize: CGFloat,
                                        weight: UIFont.Weight = .regular) -> UIFont {
        switch weight {
        case .bold:
            return UIFont(name: "SFProDisplay-Bold", size: ofSize)!
        case .semibold:
            return UIFont(name: "SFProDisplay-Semibold", size: ofSize)!
        case .medium:
            return UIFont(name: "SFProDisplay-Medium", size: ofSize)!
        default:
            return UIFont(name: "SFProDisplay-Regular", size: ofSize)!
        }
    }
}

extension UIFont {
    var weight: UIFont.Weight {
        if let fontWeight = fontDescriptor.object(forKey: UIFontDescriptor.AttributeName.face) as? String {
            switch fontWeight {
            case "Bold": return .bold
            case "Semibold": return .semibold
            case "Medium" : return .medium
            case "Light": return .light
            default: return .regular
            }
        }
        return .regular
    }
}
