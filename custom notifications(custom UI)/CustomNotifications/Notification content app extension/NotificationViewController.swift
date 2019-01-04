//
//  NotificationViewController.swift
//  Notification content app extension
//
//  Created by SunarcMac on 04/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel!
    @IBOutlet weak var btnSubscribe: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.alpha = 0.0
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
       // self.label?.text = notification.request.content.body
    }

    @IBAction func onSubscribeBtnTap(_ sender: Any) {
        UIView.animate(withDuration: 2.0) {
            self.btnSubscribe.alpha = 0.0
            self.label.textColor = UIColor.red
            self.label.alpha = 1.0
        }
    }
    
}