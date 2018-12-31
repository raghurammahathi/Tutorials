//
//  CustomLabel.swift
//  CustomControlsCG
//
//  Created by SunarcMac on 31/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

@IBDesignable class CustomLabel: UILabel {

    @IBInspectable var gradientColor = UIColor(red: 0.157, green: 0.169, blue: 0.208, alpha: 1.000)
    @IBInspectable var gradientColor2 = UIColor(red: 0.498, green: 0.498, blue: 0.620, alpha: 1.000)
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        let gradient = CGGradient(colorsSpace: nil, colors: [gradientColor.cgColor, gradientColor2.cgColor] as CFArray, locations: [0, 1])!
        let rectanglePath = UIBezierPath(rect: rect)
        context.saveGState()
        rectanglePath.addClip()
        context.drawLinearGradient(gradient, start: CGPoint(x:0, y: 0), end: CGPoint(x:self.frame.width, y: self.frame.height), options: [])
        context.restoreGState()
        rectanglePath.lineWidth = 2
        rectanglePath.stroke()
        
        // text
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key : Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 15.0),
            .foregroundColor: UIColor.white
        ]
        
        let myText = "LABEL"
        let attributedString = NSAttributedString(string: myText, attributes: attributes)
        
        let stringRect = CGRect(x: rect.width/2 - 50, y: rect.height/2 - 5, width: 100, height: 50)
        attributedString.draw(in: stringRect)
        
    }

}
