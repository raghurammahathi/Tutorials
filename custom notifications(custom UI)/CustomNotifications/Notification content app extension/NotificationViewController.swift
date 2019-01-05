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
    
    @IBOutlet weak var btnLikeUnlike: UIButton!
    @IBAction func onLikeBtnTap(_ sender: UIButton) {
        if btnLikeUnlike.isSelected == true {
            btnLikeUnlike.isSelected = false
            btnLikeUnlike.setImage(UIImage(named: "newLike"), for: UIControl.State.normal)
            
        }else {
            btnLikeUnlike.isSelected = true
            btnLikeUnlike.setImage(UIImage(named: "newLiked"), for: UIControl.State.normal)

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.alpha = 0.0
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
       // self.label?.text = notification.request.content.body
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion:
        (UNNotificationContentExtensionResponseOption) -> Void) {
        guard let currentActions = extensionContext?.notificationActions else { return }
        
        if response.actionIdentifier == "wishlist-action" {
            let pauseAction = UNNotificationAction(identifier: "pause-action", title: "Remove from wish list", options: [])
            let otherAction = currentActions[1]
            let newActions = [pauseAction, otherAction]
            extensionContext?.notificationActions = newActions
            
        } else if response.actionIdentifier == "queue-action" {
            let removeAction = UNNotificationAction(identifier: "remove-action", title: "Remove from Queue", options: [])
            let otherAction = currentActions[0]
            let newActions = [otherAction, removeAction]
            extensionContext?.notificationActions = newActions
            
        }  else if response.actionIdentifier == "pause-action" {
            let playAction = UNNotificationAction(identifier: "wishlist-action", title: "Add to wish list", options: [])
            let otherAction = currentActions[1]
            let newActions = [playAction, otherAction]
            extensionContext?.notificationActions = newActions
            
        } else if response.actionIdentifier == "remove-action" {
            let queueAction = UNNotificationAction(identifier: "queue-action", title: "Queue Next", options: [])
            let otherAction = currentActions[0]
            let newActions = [otherAction, queueAction]
            extensionContext?.notificationActions = newActions
        }
        completion(.doNotDismiss)
    }
    
    @IBAction func onSubscribeBtnTap(_ sender: Any) {
        UIView.animate(withDuration: 2.0) {
            self.btnSubscribe.alpha = 0.0
            self.label.textColor = UIColor.red
            self.label.alpha = 1.0
        }
    }
    
}
