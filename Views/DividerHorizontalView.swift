//
//  DividerHorizontalView.swift
//
//  Created by Serik on 21.01.2021.
//  Copyright © 2021 Planet41. All rights reserved.
//

import UIKit

class DividerHorizontalView: UIView {
    
    public class DividerHorizontalSubview: UIView {
        
    }
    
    override func layoutSubviews() {
        
        self.heightAnchor.constraint(equalToConstant: 1).isActive = true
        let subview = DividerHorizontalSubview(frame: CGRect.init(x: 16,
                                                                  y: 0,
                                                                  width: self.frame.width - 32,
                                                                  height: self.frame.height))
        subview.backgroundColor = .ColorBorder
        self.addSubview(subview)
        super.layoutSubviews()
    }
    
}
