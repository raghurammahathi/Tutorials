//
//  CardView.swift
//  LalsaTask
//
//  Created by Raghu ram mahathi on 31/03/19.
//  Copyright © 2019 Name. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 5
    @IBInspectable var shadowOffsetWidth: CGFloat = 0
    @IBInspectable var shadowOffsetHeight: CGFloat = 5
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: CGFloat = 0.5
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
        
    }

}
