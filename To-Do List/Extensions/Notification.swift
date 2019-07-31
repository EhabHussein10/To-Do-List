//
//  Notification.swift
//  To-Do List
//
//  Created by Ehab Eletreby on 7/31/19.
//  Copyright © 2019 Ehab Eletreby. All rights reserved.
//

import Foundation
import NotificationBannerSwift

extension UIViewController {
    func showNotificationBannerSwift(bannerTitle: String, bannerStyle: BannerStyle){
        let banner = StatusBarNotificationBanner(title: bannerTitle, style: bannerStyle)
        banner.show()
    }
}
