//
//  CustomAlertController.swift
//  FaxVPN
//
//  Created by Serik on 08.10.2021.
//

import UIKit

class CustomAlertController {
    
    var alert: UIAlertController!
    var view: UIView!
    var alertTitle: String!
    var buttonTitle1: String!
    var buttonTitle2: String!
    var buttonTitle3: String!
    var buttonTitle4: String?
    var buttonTitle5: String?

    var imageViewName1: String!
    var imageViewName2: String!
    var imageViewName3: String!
    var imageViewName4: String?
    var imageViewName5: String?
    
    var handler1 = {}
    var handler2 = {}
    var handler3 = {}
    var handler4 = {}
    var handler5 = {}
    
    let keyTextColor = "titleTextColor"
    let keyAttributedTitle = "attributedTitle"
    let keyImageTintColor = "imageTintColor"
    let keyChecked = "checked"
    let titleTextAlignment = "titleTextAlignment"
    
    var selectedNumber: Int?
    
    var titleTextColor: UIColor {
        .black
    }
    
    var textColor: UIColor {
        .PrimaryColor
    }
    
    var primaryColor: UIColor {
        .PrimaryColor
    }

    init(view: UIView,
         alertTitle: String,
         buttonTitle1: String,
         imageViewName1: String? = nil,
         buttonTitle2: String,
         imageViewName2: String? = nil,
         buttonTitle3: String,
         imageViewName3: String? = nil,
         buttonTitle4: String? = nil,
         imageViewName4: String? = nil,
         buttonTitle5: String? = nil,
         imageViewName5: String? = nil,
         selectedNumber: Int? = nil) {
        
        self.view = view
        self.alertTitle = alertTitle
        self.buttonTitle1 = buttonTitle1
        self.imageViewName1 = imageViewName1
        self.buttonTitle2 = buttonTitle2
        self.imageViewName2 = imageViewName2
        self.buttonTitle3 = buttonTitle3
        self.imageViewName3 = imageViewName3
        self.buttonTitle4 = buttonTitle4
        self.imageViewName4 = imageViewName4
        self.buttonTitle5 = buttonTitle5
        self.imageViewName5 = imageViewName5
        self.selectedNumber = selectedNumber
        
        showAlert()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func showAlert() {

        alert = UIAlertController(title: "",
                                  message: nil,
                                  preferredStyle: .actionSheet)
        
        // title
        let attributedString = NSAttributedString(string: alertTitle,
                                                  attributes: [.font : UIFont.boldSystemFont(ofSize: 18.0),
                                                               .foregroundColor : titleTextColor])
        alert.setValue(attributedString, forKey: keyAttributedTitle)
        
        // button 1
        let action1 = UIAlertAction(title: buttonTitle1,
                                    style: .default,
                                    handler: { _ in
                                        self.handler1()
        })
        action1.setValue(textColor, forKey: keyTextColor)
        action1.setValue(CATextLayerAlignmentMode.left, forKey: titleTextAlignment)

        if let imageViewName1 = imageViewName1 {
            let imageView1 = createImageView(nameImage: imageViewName1, numberImage: 1)
            alert.view.addSubview(imageView1)
        }

        // button 2
        let action2 = UIAlertAction(title: buttonTitle2,
                                    style: .default,
                                    handler: { _ in
                                        self.handler2()
        })
        action2.setValue(textColor, forKey: keyTextColor)
        action2.setValue(CATextLayerAlignmentMode.left, forKey: titleTextAlignment)

        if let imageViewName2 = imageViewName2 {
            let imageView2 = createImageView(nameImage: imageViewName2, numberImage: 2)
            alert.view.addSubview(imageView2)
        }
        // button 3
        let action3 = UIAlertAction(title: buttonTitle3,
                                    style: .default,
                                    handler: { _ in
                                        self.handler3()
        })
        action3.setValue(textColor, forKey: keyTextColor)
        action3.setValue(CATextLayerAlignmentMode.left, forKey: titleTextAlignment)

        if let imageViewName3 = imageViewName3 {
            let imageView3 = createImageView(nameImage: imageViewName3, numberImage: 3)
            alert.view.addSubview(imageView3)
        }

        showCheckedImage(action1: action1, action2: action2, action3: action3)

        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        
        // button 4
        if let buttonTitle4 = buttonTitle4 {
            
            let action4 = UIAlertAction(title: buttonTitle4,
                                        style: .default,
                                        handler: { _ in
                                            self.handler4()
            })
            action4.setValue(textColor, forKey: keyTextColor)
            action4.setValue(CATextLayerAlignmentMode.left, forKey: titleTextAlignment)
            
            if let imageViewName4 = imageViewName4 {
                let imageView4 = createImageView(nameImage: imageViewName4, numberImage: 4)
                alert.view.addSubview(imageView4)
            }
            alert.addAction(action4)
        }
        
        // button 5
        if let buttonTitle5 = buttonTitle5 {
            let action5 = UIAlertAction(title: buttonTitle5,
                                        style: .default,
                                        handler: { _ in
                                            self.handler5()
            })
            action5.setValue(textColor, forKey: keyTextColor)
            action5.setValue(CATextLayerAlignmentMode.left, forKey: titleTextAlignment)

            if let imageViewName5 = imageViewName5 {
                let imageView5 = createImageView(nameImage: imageViewName5, numberImage: 5)
                alert.view.addSubview(imageView5)
            }
            alert.addAction(action5)
        }
        
        // Cancel
        let cancelAlert = UIAlertAction(title: "Cancel",
                                        style: .cancel,
                                        handler: nil)
        cancelAlert.setValue(primaryColor, forKey: keyTextColor)
        alert.addAction(cancelAlert)

        createAlertForiPad()
    }
    
    private func createImageView(nameImage: String, numberImage: Double) -> UIImageView {

        let size = 25.0
        let imageView = UIImageView(frame: CGRect(x: 15.0,
                                                  y: 60.0 + 57.0 * (numberImage - 1),
                                                  width: size,
                                                  height: size))
        imageView.image = UIImage(named: nameImage)
        imageView.tintColor = primaryColor
        return imageView
    }
    
    private func showCheckedImage(action1: UIAlertAction, action2: UIAlertAction, action3: UIAlertAction) {
        
        guard let selectedNumber = selectedNumber else { return }
        
        switch selectedNumber {
        case 1:
            showCheckedImage(isChecked: true, action: action1)
            showCheckedImage(isChecked: false, action: action2)
            showCheckedImage(isChecked: false, action: action3)
            break
        case 2:
            showCheckedImage(isChecked: false, action: action1)
            showCheckedImage(isChecked: true, action: action2)
            showCheckedImage(isChecked: false, action: action3)
            break
        case 3:
            showCheckedImage(isChecked: false, action: action1)
            showCheckedImage(isChecked: false, action: action2)
            showCheckedImage(isChecked: true, action: action3)
        default:
            showCheckedImage(isChecked: false, action: action1)
            showCheckedImage(isChecked: false, action: action2)
            showCheckedImage(isChecked: false, action: action3)
        }
    }
    
    private func showCheckedImage(isChecked: Bool, action: UIAlertAction) {
        action.setValue(primaryColor, forKey: keyImageTintColor)
        action.setValue(isChecked, forKey: keyChecked)
    }
    
    private func createAlertForiPad() {
        
        if let popoverController = alert.popoverPresentationController {
           popoverController.sourceView = self.view
           popoverController.sourceRect = CGRect(x: self.view.bounds.midX,
                                                 y: self.view.bounds.midY,
                                                 width: .zero,
                                                 height: .zero)
           popoverController.permittedArrowDirections = []
         }
    }
    
}
