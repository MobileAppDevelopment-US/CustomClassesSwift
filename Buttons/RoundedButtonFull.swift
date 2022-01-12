//
//  RoundedButton.swift
//
//  Created by Serik on 12/05/21.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

@IBDesignable
final class RoundedButton: CustomFontButton {
    
    // MARK: - Private Properties
    
    private var _circle = false
    private var _borderColor = UIColor.clear
    private var _borderWidth: CGFloat = 0
    private var _cornerRadius: CGFloat = 0
    
    private var _firstGradientColor: UIColor?
    private var _secondGradientColor: UIColor?
    private var _gradientStartPointX: CGFloat = 0
    private var _gradientStartPointY: CGFloat = 0
    private var _gradientEndPointX: CGFloat = 1
    private var _gradientEndPointY: CGFloat = 1
    private let _gradientLayer = CAGradientLayer()
    
    private var _roundBottomLeft = true
    private var _roundBottomRight = true
    private var _roundTopLeft = true
    private var _roundTopRight = true
    private var roundingCorners = CACornerMask()
    
    private var _applyShadow = false
    private var _shadowColor = UIColor.black
    private var _shadowAlpha: CGFloat = 0.25
    private var _shadowX: CGFloat = 0
    private var _shadowY: CGFloat = 4
    private var _shadowBlur: CGFloat = 4
    private var _shadowSpread: CGFloat = 0
    
    private var _imageViewScaleSx: CGFloat = 1
    private var _imageViewScaleSy: CGFloat = 1
    private var _imageViewScaleSz: CGFloat = 1
    
    private var _firstTitleGradientColor: UIColor?
    private var _secondTitleGradientColor: UIColor?
    
    // MARK: - IBInspectable

    @IBInspectable var circle: Bool {
        set {
            _circle = newValue
            setCornerRadius()
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
    
    // MARK: - Gradient
    
    @IBInspectable
    var firstGradientColor: UIColor? {
        set {
            _firstGradientColor = newValue
            setGradient()
        }
        get {
            return self._firstGradientColor
        }
    }
    
    @IBInspectable
    var secondGradientColor: UIColor? {
        set {
            _secondGradientColor = newValue
            setGradient()
        }
        get {
            return self._secondGradientColor
        }
    }
    
    @IBInspectable
    var gradientStartPointX: CGFloat {
        set {
            _gradientStartPointX = newValue
            setGradient()
        }
        get {
            return self._gradientStartPointX
        }
    }
    
    @IBInspectable
    var gradientStartPointY: CGFloat {
        set {
            _gradientStartPointY = newValue
            setGradient()
        }
        get {
            return self._gradientStartPointY
        }
    }
    
    @IBInspectable
    var gradientEndPointX: CGFloat {
        set {
            _gradientEndPointX = newValue
            setGradient()
        }
        get {
            return self._gradientEndPointX
        }
    }
    
    @IBInspectable
    var gradientEndPointY: CGFloat {
        set {
            _gradientEndPointY = newValue
            setGradient()
        }
        get {
            return self._gradientEndPointY
        }
    }
    
    // MARK: - Corners to round
    
    @IBInspectable
    var roundBottomLeft: Bool {
        set {
            _roundBottomLeft = newValue
            setRoundedCorners()
        }
        get {
            return self._roundBottomLeft
        }
    }
    
    @IBInspectable
    var roundBottomRight: Bool {
        set {
            _roundBottomRight = newValue
            setRoundedCorners()
        }
        get {
            return self._roundBottomRight
        }
    }
    
    @IBInspectable
    var roundTopLeft: Bool {
        set {
            _roundTopLeft = newValue
            setRoundedCorners()
        }
        get {
            return self._roundTopLeft
        }
    }
    
    @IBInspectable
    var roundTopRight: Bool {
        set {
            _roundTopRight = newValue
            setRoundedCorners()
        }
        get {
            return self._roundTopRight
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable
    var applyShadow: Bool {
        set {
            _applyShadow = newValue
            setShadow()
        }
        get {
            return self._applyShadow
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor {
        set {
            _shadowColor = newValue
            setShadow()
        }
        get {
            return self._shadowColor
        }
    }
    
    @IBInspectable
    var shadowAlpha: CGFloat {
        set {
            _shadowAlpha = newValue
            setShadow()
        }
        get {
            return self._shadowAlpha
        }
    }
    
    @IBInspectable
    var shadowX: CGFloat {
        set {
            _shadowX = newValue
            setShadow()
        }
        get {
            return self._shadowX
        }
    }
    
    @IBInspectable
    var shadowY: CGFloat {
        set {
            _shadowY = newValue
            setShadow()
        }
        get {
            return self._shadowY
        }
    }
    
    @IBInspectable
    var shadowBlur: CGFloat {
        set {
            _shadowBlur = newValue
            setShadow()
        }
        get {
            return self._shadowBlur
        }
    }
    
    @IBInspectable
    var shadowSpread: CGFloat {
        set {
            _shadowSpread = newValue
            setShadow()
        }
        get {
            return self._shadowSpread
        }
    }
    
    // MARK: - ImageView layer Transform3D
    
    @IBInspectable
    var imageViewScaleSx: CGFloat {
        set {
            _imageViewScaleSx = newValue
            setShadow()
        }
        get {
            return self._imageViewScaleSx
        }
    }
    
    @IBInspectable
    var imageViewScaleSy: CGFloat {
        set {
            _imageViewScaleSy = newValue
            setShadow()
        }
        get {
            return self._imageViewScaleSy
        }
    }
    
    @IBInspectable
    var imageViewScaleSz: CGFloat {
        set {
            _imageViewScaleSz = newValue
            setShadow()
        }
        get {
            return self._imageViewScaleSz
        }
    }
    
    // MARK: - Title Gradient
    
    @IBInspectable
    var firstTitleGradientColor: UIColor? {
        set {
            _firstTitleGradientColor = newValue
            setTitleGradient()
        }
        get {
            return self._firstTitleGradientColor
        }
    }
    
    @IBInspectable
    var secondTitleGradientColor: UIColor? {
        set {
            _secondTitleGradientColor = newValue
            setTitleGradient()
        }
        get {
            return self._secondTitleGradientColor
        }
    }
    
    // MARK: - Override Properties

    override internal var frame: CGRect {
        set {
            super.frame = newValue
            setCornerRadius()
            setGradient()
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
                if let firstGradientColor = _firstGradientColor, let secondGradientColor = _secondGradientColor {
                    _gradientLayer.colors = [firstGradientColor.resolvedColor(with: self.traitCollection).cgColor, secondGradientColor.resolvedColor(with: self.traitCollection).cgColor]
                }
            }
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        onDidMoveToWindow()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        onLayoutSubviews()
        setTitleGradient(rect: self.titleLabel?.frame)
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
    }
    
    // MARK: - Private Methods

    private func setBorderColor() {
        self.layer.borderColor = self._borderColor.cgColor
    }

    private func setBorderWidth() {
        self.layer.borderWidth = self._borderWidth
    }
    
    private func setCornerRadius() {
        if self.circle {
           _cornerRadius = (self.frame.width + self.frame.height) / 4
        }
        setRoundedCorners()
        setGradient()
        setShadow()
    }
    
    private func setGradient() {
        if let firstGradientColor = _firstGradientColor, let secondGradientColor = _secondGradientColor {
            self.backgroundColor = nil
            _gradientLayer.frame = bounds
            _gradientLayer.colors = [firstGradientColor.cgColor, secondGradientColor.cgColor]
            _gradientLayer.startPoint = CGPoint(x: gradientStartPointX, y: gradientStartPointY)
            _gradientLayer.endPoint = CGPoint(x: gradientEndPointX, y: gradientEndPointY)
            _gradientLayer.borderColor = _borderColor.cgColor
            
            layer.insertSublayer(_gradientLayer, at: 0)
        } else {
            _gradientLayer.removeFromSuperlayer()
        }
    }
    
    private func setRoundedCorners() {
        getRoundedCorners()
        
        if shouldRoundEachCorner() {
            _gradientLayer.cornerRadius = _cornerRadius
            self.layer.cornerRadius = _cornerRadius
        } else {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = _cornerRadius
            self.layer.maskedCorners = roundingCorners
            _gradientLayer.masksToBounds = true
            _gradientLayer.cornerRadius = _cornerRadius
            _gradientLayer.maskedCorners = roundingCorners
        }
    }
    
    private func getRoundedCorners() {
        self.roundingCorners = { () -> CACornerMask in
            var options = CACornerMask()
            if _roundBottomLeft {
                options.insert(.layerMinXMaxYCorner)
            }
            if _roundBottomRight {
                 options.insert(.layerMaxXMaxYCorner)
            }
            if _roundTopLeft {
                 options.insert(.layerMinXMinYCorner)
            }
            if _roundTopRight {
                options.insert(.layerMaxXMinYCorner)
            }
            return options
        }()
    }
    
    private func shouldRoundEachCorner() -> Bool {
        let allCorners: [CACornerMask] = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        return allCorners.map({ roundingCorners.contains($0) }).allSatisfy({ $0 == true })
    }
    
    private func setShadow() {
        if applyShadow {
            self.layer.applySketchShadow(color: _shadowColor, alpha: _shadowAlpha, x: _shadowX, y: _shadowY, blur: _shadowBlur, spread: _shadowSpread)
        }
    }
    
    private func setImageViewTransform() {
        imageView?.layer.transform = CATransform3DMakeScale(_imageViewScaleSx, _imageViewScaleSy, _imageViewScaleSz)
    }
    
    private func setTitleGradient(rect: CGRect? = nil) {
        if let firstTitleGradientColor = _firstTitleGradientColor, let secondTitleGradientColor = _secondTitleGradientColor {
            if let gradientColor = UIColor.getGradientColor(in: rect ?? (self.titleLabel?.bounds ?? .zero), colors: [firstTitleGradientColor.cgColor, secondTitleGradientColor.cgColor], startPoint: CGPoint(x: 0, y: 0.25), endPoint: CGPoint(x: (self.titleLabel?.bounds ?? .zero).width, y: 0.75)) {
                self.titleLabel?.textColor = gradientColor
            }
        }
    }
    
    private func onDidMoveToWindow() {
        setImageViewTransform()
    }
    
    private func onLayoutSubviews() {
        setGradient()
        setShadow()
    }
    
}

