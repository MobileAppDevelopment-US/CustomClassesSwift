//
//  RoundedSearchBar.swift
//
//  Created by Serik on 5/28/20.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

class RoundedSearchBar: UISearchBar {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            configView()
        }
    }
    override var bounds: CGRect{
        didSet{
            configView()
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 14 {
        didSet {
            configView()
        }
    }
    
    func configView(){
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.searchTextField.backgroundColor = .clear
        self.searchTextField.tintColor = UIColor.ColorTextDark
         let searchIcon = self.searchTextField.leftView!
        self.setPositionAdjustment(UIOffset(horizontal: 5, vertical: 0), for: UISearchBar.Icon.search)
        self.setImage(UIImage(named: "scanner_plus_ic_search"), for: .search, state: .normal)
        
        self.searchTextField.setValue(UIColor.ColorTextDark, forKeyPath:"placeholderLabel.textColor")
        
        if self.searchTextField.font?.isBold == true {
            self.searchTextField.font = UIFont.init(name: CustomFont.bold, size: fontSize)
        }
        else {
            self.searchTextField.font = UIFont.init(name: CustomFont.regular, size: fontSize)
        }
        
        let textFieldInsideUISearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(fontSize)
    }
}
