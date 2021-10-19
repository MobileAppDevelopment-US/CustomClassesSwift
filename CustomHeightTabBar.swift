//
//  CustomHeightTabBar.swift
//
//  Created by Serik on 5/28/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import Foundation
import UIKit

class CustomHeightTabBar: UITabBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
          var size = super.sizeThatFits(size)
          size.height = 72 + (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
          return size
    }
    override init(frame: CGRect) {
        
        super.init(frame: frame)
       
    }
     @IBInspectable
       var cornerRadius2: CGFloat = 20 {
           didSet {
               configTabBar()
           }
       }
    
      required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
      }
    
    
    override func layoutSubviews() {
        configTabBar()
        super.layoutSubviews()
    }
    
    private var backgroundView: UIView?
    func configTabBar(){
        self.layer.masksToBounds = true
        self.isTranslucent = true
        self.barStyle = .blackOpaque
        self.layer.cornerRadius = cornerRadius2
      //  self.backgroundColor = .ColorBackground
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.ColorBorder.cgColor
        self.clipsToBounds = true
        
        if let backgroundView = backgroundView {
            backgroundView.frame = self.bounds
        } else {
            backgroundView = UIView(frame: self.bounds)
            backgroundView!.backgroundColor = self.barTintColor
            self.addSubview(backgroundView!)
            self.sendSubviewToBack(backgroundView!)
        }
    }
    override var bounds: CGRect{
           didSet{
               configTabBar()
           }
       }
       
    
}
