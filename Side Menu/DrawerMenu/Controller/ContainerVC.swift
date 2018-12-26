//
//  ViewController.swift
//  DrawerMenu
//
//  Created by SunarcMac on 26/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
   @objc func toggleSideMenu(){
        if sideMenuOpen {
            sideMenuOpen = false
            sideMenuConstraint.constant = -240
        } else {
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }
    }


}

