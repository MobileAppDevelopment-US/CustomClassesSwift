//
//  RoundedImageView.swift
//
//  Created by Serik on 12/05/21.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

@IBDesignable
final class RoundedImageView: UIImageView {
    
    // MARK: - Private Properties
    
    private var _circle = false
    private var _borderColor = UIColor.clear
    private var _borderWidth: CGFloat = 0
    private var _cornerRadius: CGFloat = 0
    
    // MARK: - IBInspectable

    @IBInspectable var circle: Bool {
        set {
            _circle = newValue
            round()
        }
        get {
            return self._circle
        }
    }

    @IBInspectable var borderColor: UIColor {
        set {
            _borderColor = newValue
            setBorderColor()
        }
        get {
            return self._borderColor
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        set {
            _borderWidth = newValue
            setBorderWidth()
        }
        get {
            return self._borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            _cornerRadius = newValue
            setCornerRadius()
        }
        get {
            return self._cornerRadius
        }
    }
    
    // MARK: - Override Properties

    override internal var frame: CGRect {
        set {
            super.frame = newValue
            round()
        }
        get {
            return super.frame
        }
    }
    
    // MARK: - Lifecycle
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
                layer.borderColor = borderColor.resolvedColor(with: self.traitCollection).cgColor
            }
        }
    }
    
    // MARK: - Private Methods

    private func round() {
        if self.circle {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        } else {
            self.layer.cornerRadius = _cornerRadius
        }
    }

    private func setBorderColor() {
        self.layer.borderColor = self._borderColor.cgColor
    }

    private func setBorderWidth() {
        self.layer.borderWidth = self._borderWidth
    }
    
    private func setCornerRadius() {
        self.layer.cornerRadius = self._cornerRadius
    }
    
}
