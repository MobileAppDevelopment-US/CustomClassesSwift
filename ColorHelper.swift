//
//  ColorHelper.swift
//
//  Created by Serik on 19/01/22.
//  Copyright © 2020 Serik. All rights reserved.
//

import Foundation
import UIKit

enum AssetsColor: String {
    case Black1
    case Black2
    case Black3
    case Blue
    case Gradient1
    case Gradient2
    case GradientBlack1
    case GradientBlack2
    case Green
    case Primary1
    case Primary2
    case Primary2_50
    case White1
    case White1_75
    case White2
    case Error
    case Orange
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
}

extension UIColor {
    class func getGradientColor_RepostFMM(in rect: CGRect,
                                          colors: [CGColor],
                                          startPoint: CGPoint,
                                          endPoint: CGPoint) -> UIColor? {
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.saveGState()
        defer { currentContext?.restoreGState() }

        let size = rect.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray, locations: nil) else { return nil }

        let context = UIGraphicsGetCurrentContext()
        context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return nil }
        return UIColor(patternImage: image)
    }
}
