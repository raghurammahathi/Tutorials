//
//  ViewController.swift
//  ViewPagerUsingTabBarController
//
//  Created by Raghu ram mahathi on 24/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @objc func swipeLeft(sender:UISwipeGestureRecognizer) {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
        
    }
    
    @objc func swipeRight(sender:UISwipeGestureRecognizer) {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = self.tabBarController!.tabBar
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.red, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineHeight: 2.0)
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
        
    }
    
    
    
    
}



