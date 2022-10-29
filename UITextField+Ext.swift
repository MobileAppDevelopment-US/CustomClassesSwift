//
//  UIFont_Ext.swift
//
//  Created by Serik on 03/10/22.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 45))
        UIView.addAccessory(textField: self)
        self.inputAccessoryView = UIView
    }
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
extension UITextView {
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                        target: nil,
                                        action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done",
                                                    style: UIBarButtonItem.Style.done,
                                                    target: self,
                                                    action: #selector(doneButtonAction))
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
