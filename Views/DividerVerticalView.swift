//
//  DividerVerticalView.swift
//
//  Created by Serik on 21.01.2021.
//  Copyright © 2021 Planet41. All rights reserved.
//

import UIKit

class DividerVerticalView: UIView {
    
    public class DividerVerticalSubview: UIView {
        
    }
    
    override func layoutSubviews() {
        
        self.heightAnchor.constraint(equalToConstant: 1).isActive = true
        let subview = DividerVerticalSubview(frame: CGRect.init(x: 0,
                                                                y: 8,
                                                                width: self.frame.width,
                                                                height: self.frame.height - 16))
        subview.backgroundColor = .ColorBorder
        self.addSubview(subview)
        super.layoutSubviews()
    }
    
}
