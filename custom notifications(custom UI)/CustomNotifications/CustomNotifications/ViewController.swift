//
//  ViewController.swift
//  CustomNotifications
//
//  Created by SunarcMac on 04/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onSendNotTap(_ sender: Any) {
        
        appDelegate?.scheduleNotification()
    }
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

