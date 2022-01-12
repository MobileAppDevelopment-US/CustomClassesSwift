//
//  UIView+Rx.swift
//
//  Created by Serik on 12/05/21.
//  Copyright © 2020 Serik. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import RxGesture

extension Reactive where Base: UIView {
    
    var tap: ControlEvent<Void> {
        return ControlEvent(events: tapGesture()
            .when(.recognized)
            .map{_ in ()})
    }
    
    var tapGesture: ControlEvent<UITapGestureRecognizer> {
        return ControlEvent(events: tapGesture()
            .when(.recognized)
            .map{ gesture in (gesture)})
    }
    
    var touch: ControlEvent<Void> {
        return ControlEvent(events: touchDownGesture()
            .when(.began)
            .map{_ in ()})
    }
    
    func animatedTap(mode: ViewAnimationMode) -> ControlEvent<Void> {
        return ControlEvent(events: anyGesture((.touchDown(), when:.began), (.tap(), when: .recognized))
        .do(onNext:  { [weak base] in
            if($0.state == .began){
                base?.animateTap(mode: mode)
            }
        })
        .when(.recognized)
        .map{_ in ()})
    }
   
}

enum ViewAnimationMode{
    case text
    case textBorderImageWhite
    case textBorderImageRed
    case textBorder
}

extension UIView {
    func animateTap(mode: ViewAnimationMode) {
        switch mode {
        case .text:
            animateTextTap()
     
        case .textBorderImageWhite:
            animateTextBorderImageWhiteTap()
        case .textBorderImageRed:
            animateTextBorderImageRedTap()
        case .textBorder:
            animateTextBorderTap()
        }
    }
    
    private func animateTextTap(){
        let bgcolor = self.backgroundColor
        let labels = self.subviews.compactMap { $0 as? UILabel }
        let labelsColor = labels.compactMap{$0.textColor}
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
            //self.backgroundColor = .ColorRedDark
            labels.enumerated().forEach { ( index, label ) in
                //label.textColor = .ColorTextLight
            }
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
                self.backgroundColor = bgcolor
                
                labels.enumerated().forEach { ( index, label ) in
                    label.textColor = labelsColor[index]
                }
            })
        }
        
    }
    
    private func animateTextBorderImageWhiteTap(){
        let bgcolor = self.backgroundColor
        let labels = self.subviews.compactMap { $0 as? UILabel }
        let images = self.subviews.compactMap { $0 as? UIImageView }
            .map{image -> UIImageView in
                image.image = image.image?.withRenderingMode(.alwaysTemplate)
                return image
        }
        let labelsColor = labels.compactMap{$0.textColor}
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
            //self.backgroundColor = .ColorRedDark
            self.layer.borderWidth = 0
            
            labels.enumerated().forEach { ( index, label ) in
                //label.textColor = .ColorTextLight
            }
            images.enumerated().forEach { ( index, image ) in
                //image.tintColor = .ColorTextLight
            }
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
                self.backgroundColor = bgcolor
                self.layer.borderWidth = 1
                //self.layer.borderColor = UIColor.ColorBorder.cgColor
                
                
                labels.enumerated().forEach { ( index, label ) in
                    label.textColor = labelsColor[index]
                }
                images.enumerated().forEach { ( index, image ) in
                    //image.tintColor = .ColorRedDark
                }
            })
        }
    }
    
    
    private func animateTextBorderImageRedTap(){
        let bgcolor = self.backgroundColor
        let labels = self.subviews.compactMap { $0 as? UILabel }
        let images = self.subviews.compactMap { $0 as? UIImageView }
            .map{image -> UIImageView in
                image.image = image.image?.withRenderingMode(.alwaysTemplate)
                return image
        }
        let labelsColor = labels.compactMap{$0.textColor}
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
            //self.backgroundColor = .ColorRedLight
            self.layer.borderWidth = 1
            //self.layer.borderColor = UIColor.ColorBorder.cgColor
            
            labels.enumerated().forEach { ( index, label ) in
                //label.textColor = .ColorRedDark
            }
            images.enumerated().forEach { ( index, image ) in
                //image.tintColor = .ColorRedDark
            }
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
                self.backgroundColor = bgcolor
                self.layer.borderWidth = 0
                
                
                labels.enumerated().forEach { ( index, label ) in
                    label.textColor = labelsColor[index]
                }
                images.enumerated().forEach { ( index, image )  in
                    //image.tintColor = .ColorTextLight
                }
            })
        }
    }
    
    
    private func animateTextBorderTap(){
        let bgcolor = self.backgroundColor
        let labels = self.subviews.compactMap { $0 as? UILabel }
        
        let labelsColor = labels.compactMap{$0.textColor}
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
            //self.backgroundColor = .ColorRedDark
            self.layer.borderWidth = 0
            
            labels.enumerated().forEach { ( index, label ) in
                //label.textColor = .ColorTextLight
            }
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
                self.backgroundColor = bgcolor
                self.layer.borderWidth = 1
                //self.layer.borderColor = UIColor.ColorBorder.cgColor
                
                
                labels.enumerated().forEach { ( index, label ) in
                    label.textColor = labelsColor[index]
                }
                
            })
        }
    }
     
}

//class HapticTapGestureRecognizer: UITapGestureRecognizer {
//
//    var highlightOnTouch = true
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
//        super.touchesBegan(touches, with: event)
//        UIImpactFeedbackGenerator().notifyLightImpactOccurred()
//
//        if highlightOnTouch {
//          //  let bgcolor = view?.backgroundColor
//            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
//                //self.view?.backgroundColor = UIColor(named: "colorSelected")
//            }) { (_) in
//                UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveLinear], animations: {
//                    //self.view?.backgroundColor = bgcolor
//                })
//            }
//        }
//    }
//
//}
//

