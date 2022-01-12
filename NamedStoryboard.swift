//
//  NamedStoryboard.swift
//
//  Created by Serik on 12/05/21.
//  Copyright © 2020 Serik. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class var splash: UIStoryboard {
        return UIStoryboard(name: "Splash", bundle: nil)
    }
    class var home: UIStoryboard {
        return UIStoryboard(name: "Home", bundle: nil)
    }
    class var menu: UIStoryboard {
        return UIStoryboard(name: "Menu", bundle: nil)
    }
    class var loginWebview: UIStoryboard {
        return UIStoryboard(name: "LoginWebview", bundle: nil)
    }
    class var faq: UIStoryboard {
        return UIStoryboard(name: "FAQ", bundle: nil)
    }
    class var accounts: UIStoryboard {
        return UIStoryboard(name: "Accounts", bundle: nil)
    }
    class var privateAccount: UIStoryboard {
        return UIStoryboard(name: "PrivateAccount", bundle: nil)
    }
    class var deletePost: UIStoryboard {
        return UIStoryboard(name: "DeletePost", bundle: nil)
    }
    class var posts: UIStoryboard {
        return UIStoryboard(name: "Posts", bundle: nil)
    }
    class var detailRepost: UIStoryboard {
        return UIStoryboard(name: "DetailRepost", bundle: nil)
    }
    class var moreSettings: UIStoryboard {
        return UIStoryboard(name: "MoreSettings", bundle: nil)
    }
    class var selectMedia: UIStoryboard {
        return UIStoryboard(name: "SelectMedia", bundle: nil)
    }
    class var allowPhotos: UIStoryboard {
        return UIStoryboard(name: "AllowPhotos", bundle: nil)
    }
    class var openInstagram: UIStoryboard {
        return UIStoryboard(name: "OpenInstagram", bundle: nil)
    }
    class var postToInstagram: UIStoryboard {
        return UIStoryboard(name: "PostToInstagram", bundle: nil)
    }
    class var premium: UIStoryboard {
        return UIStoryboard(name: "Premium", bundle: nil)
    }
}

extension UIStoryboard {
    enum VCID: String {
        case `default`
        case detailRepostVC = "DetailRepostVC"
    }
    func instantiateVC(with id: VCID) -> UIViewController {
        return instantiateViewController(withIdentifier: id.rawValue)
    }
    func instantiateInitialVC() -> UIViewController {
        return instantiateInitialViewController()!
    }
    func instantiateChildVC(for rootNcWithId: VCID) -> UIViewController {
        return (instantiateViewController(withIdentifier: rootNcWithId.rawValue) as! UINavigationController).viewControllers.first!
    }
}

