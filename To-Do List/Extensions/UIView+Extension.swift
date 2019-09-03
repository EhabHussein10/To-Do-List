//
//  UIView+ Extension.swift
//  To-Do List
//
//  Created by Ehab Eletreby on 9/3/19.
//  Copyright © 2019 Ehab Eletreby. All rights reserved.
//

import Foundation
import NotificationBannerSwift

extension UIView {
    func showNotificationBannerSwift(bannerTitle: String, bannerStyle: BannerStyle){
        let banner = StatusBarNotificationBanner(title: bannerTitle, style: bannerStyle)
        banner.show()
    }
}
