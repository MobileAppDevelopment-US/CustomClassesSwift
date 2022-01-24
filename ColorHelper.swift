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

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    convenience init?(hexaRGBA: String) {
        var chars = Array(hexaRGBA.hasPrefix("#") ? hexaRGBA.dropFirst() : hexaRGBA[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars.append(contentsOf: ["F", "F"])
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0 ... 1]), nil, 16)) / 255,
                  green: .init(strtoul(String(chars[2 ... 3]), nil, 16)) / 255,
                  blue: .init(strtoul(String(chars[4 ... 5]), nil, 16)) / 255,
                  alpha: .init(strtoul(String(chars[6 ... 7]), nil, 16)) / 255)
    }
}
