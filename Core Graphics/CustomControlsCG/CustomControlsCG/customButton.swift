//
//  customButton.swift
//  CustomControlsCG
//
//  Created by SunarcMac on 31/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor(red: 16/255.0, green: 206/255.0, blue: 132/255.0, alpha: 1.0)
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        fillColor.setFill()
        path.fill()
    }
}
