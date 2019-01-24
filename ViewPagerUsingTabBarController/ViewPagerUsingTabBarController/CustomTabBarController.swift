//
//  CustomTabBarController.swift
//  ViewPagerUsingTabBarController
//
//  Created by Raghu ram mahathi on 24/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController,UITabBarControllerDelegate {
    
    @IBOutlet var CustomTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
       
    }
    
    override func viewDidLayoutSubviews()
    {
        CustomTabBar.frame = CGRect.init(x:0,y:0,width:UIScreen.main.bounds.width,height:50)
        let tabs = self.tabBar.items!
        let normalFont = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        let normalTitleColor = UIColor.gray


        for i in tabs {
            
            i.setTitleTextAttributes([NSAttributedString.Key.font: normalFont, NSAttributedString.Key.foregroundColor: normalTitleColor], for: UIControl.State.normal)        }
    }
    
    let selectedTitleFont = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
    let selectedTitleColor = UIColor.black

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        item.setTitleTextAttributes([NSAttributedString.Key.font: selectedTitleFont, NSAttributedString.Key.foregroundColor: selectedTitleColor], for: UIControl.State.normal)
        
    }
        
    
    
    
    //    override func viewWillLayoutSubviews() {
    //        super.viewWillLayoutSubviews()
    //        var tabFrame:CGRect = self.CustomTabBar.frame
    //        tabFrame.origin.y = self.view.frame.origin.y
    //        self.CustomTabBar.frame = tabFrame
    //    }
    
    
}

extension UIImage {
    func createSelectionIndicator(color: UIColor, size: CGSize, lineHeight: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint(x: 0,y :size.height - lineHeight), size: CGSize(width: size.width, height: lineHeight)))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
