//
//  UIFont_Ext.swift
//
//  Created by Serik on 03/10/22.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit
import AttributedTextView

class ViewController: UIViewController {
    
    @IBOutlet weak var termsTextView: AttributedTextView!

    func configure() {
        termsTextView.attributer = "repost_fm_premium_term_condition_1".localize_RepostIGProM().color(UIColor.appColor(.Gray1)!)
            .append("repost_fm_premium_term_condition_2".localize_RepostIGProM()).underline.makeInteract({ (_) in
                self.openURL(appUrl: RepostIGPro_Constants.termsUrl, webUrl: RepostIGPro_Constants.termsUrl)
            })
            .append("repost_fm_premium_term_condition_3".localize_RepostIGProM()).color(UIColor.appColor(.Gray1)!)
            .append("repost_fm_premium_term_condition_4".localize_RepostIGProM()).underline.makeInteract({ (_) in
                self.openURL(appUrl: RepostIGPro_Constants.policyUrl, webUrl: RepostIGPro_Constants.policyUrl)
            })
            .all.font(UIFont.sfProDisplayFont_RepostIGProM(ofSize: 13, weight: .semibold)).setLinkColor(UIColor.appColor(.Gray1)!).setLinkColor(UIColor.appColor(.Gray1)!).paragraphAlignCenter.paragraphSpacing(3).paragraphApplyStyling
    }
    
}
