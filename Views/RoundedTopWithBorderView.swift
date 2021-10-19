//
//  RoundedTopWithBorderView.swift
//
//  Created by Serik on 5/30/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

class RoundedTopWithBorderView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            configTabBar()
        }
    }
    
    override func layoutSubviews() {
        configTabBar()
        super.layoutSubviews()
    }
    
    func configTabBar(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius 
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.ColorBorder.cgColor
        self.clipsToBounds = true
        
    }
    override var bounds: CGRect{
        didSet{
            configTabBar()
        }
    }
    
}
