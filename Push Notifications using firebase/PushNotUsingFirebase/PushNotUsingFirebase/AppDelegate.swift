//
//  AppDelegate.swift
//  PushNotUsingFirebase
//
//  Created by SunarcMac on 14/11/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    var window: UIWindow?
    let badgeCount: Int = 10
    static var shared: AppDelegate { return UIApplication.shared.delegate as! AppDelegate }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Messaging.messaging().delegate = self
        self.registerForPushNotifications()
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        application.applicationIconBadgeNumber = badgeCount

        return true
    }
}
