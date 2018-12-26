//
//  MainVC.swift
//  DrawerMenu
//
//  Created by SunarcMac on 26/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onMenuTap(_ sender: Any) {
        print("toggle side menu")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
   
    

 

}
