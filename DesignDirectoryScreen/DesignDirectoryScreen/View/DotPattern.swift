//
//  DotPattern.swift
//  DesignDirectoryScreen
//
//  Created by SunarcMac on 24/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

@IBDesignable
class DotPattern: UIView {
    
    //1
    @IBInspectable var lightColor: UIColor = UIColor.orange
    @IBInspectable var darkColor: UIColor = UIColor.yellow
    @IBInspectable var patternSize: CGFloat = 200
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(darkColor.cgColor)
        context.fill(rect)
        
        let drawSize = CGSize(width: patternSize, height: patternSize)
        
        UIGraphicsBeginImageContextWithOptions(drawSize, true, 0.0)
        let drawingContext = UIGraphicsGetCurrentContext()!
        darkColor.setFill()
        drawingContext.fill(CGRect(x: 0, y: 0, width: drawSize.width, height: drawSize.height))
        
        
        let circularPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: drawSize.width, height: drawSize.height), cornerRadius: 10)
        
       
        
        lightColor.setFill()
        circularPath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        UIColor(patternImage: image).setFill()
        context.fill(rect)
    }
}
