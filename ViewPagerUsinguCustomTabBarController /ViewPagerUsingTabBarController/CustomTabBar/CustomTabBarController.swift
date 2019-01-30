//
//  CustomTabBarController.swift
//  ViewPagerUsingTabBarController
//
//  Created by Raghu ram mahathi on 24/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController,UITabBarControllerDelegate {
    
    let selectedTitleFont = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
    let selectedTitleColor = UIColor.black
    
    @IBOutlet var CustomTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "American Typewriter", size: 20)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

    }
    
    override func viewDidLayoutSubviews()
    {
        CustomTabBar.frame = CGRect.init(x:0,y:0,width:UIScreen.main.bounds.width,height:50)

    }
    
   

//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//
//        item.setTitleTextAttributes([NSAttributedString.Key.font: selectedTitleFont, NSAttributedString.Key.foregroundColor: selectedTitleColor], for: UIControl.State.selected)
//
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
