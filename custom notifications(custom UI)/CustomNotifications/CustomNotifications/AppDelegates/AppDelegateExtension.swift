//
//  AppDelegateExtension.swift
//  CustomNotifications
//
//  Created by SunarcMac on 04/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation
import UserNotifications

extension AppDelegate {
   
    func setNotificationCategory(){
    
    //   let okAction = UNNotificationAction(identifier: "ok", title: "OK", options:[])
    //   let cancelAction = UNNotificationAction(identifier: "cancel", title: "cancel", options: [])
    
    let category = UNNotificationCategory(identifier: "category", actions: [], intentIdentifiers: [], options: [])
    UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
    func scheduleNotification () {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats:false)
        let content = UNMutableNotificationContent()
        content.title = "My Custom Notification"
        content.body = "Pull down and Click on Subscribe button to Subscribe for suncart service"
        content.categoryIdentifier = "category"
        content.sound = UNNotificationSound.default
        
        guard let path = Bundle.main.path(forResource: "newLiked", ofType: "png") else  {return}
        let url = URL(fileURLWithPath: path)
        
        do {
            let attachment = try UNNotificationAttachment(identifier: "logo", url: url, options: nil)
            content.attachments = [attachment]
        } catch  {
            print("attachment cant be loaded")
        }
        
        let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { (error:Error?) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
