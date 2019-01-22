//
//  CustomBackView.swift
//  AmazonScreenDesign
//
//  Created by Raghu ram mahathi on 22/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit

@IBDesignable class CustomBackView: UIView {

     @IBInspectable var fillColor: UIColor = UIColor(red: 16/255.0, green: 206/255.0, blue: 132/255.0, alpha: 1.0)
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let rectangle = CGRect(x: 1, y: 1, width: 52, height: 52)
        context?.setFillColor(fillColor.cgColor)
        context?.addEllipse(in: rectangle)
        context?.drawPath(using: CGPathDrawingMode.fill)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
