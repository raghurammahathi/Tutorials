//
//  CustomOfferView.swift
//  AmazonScreenDesign
//
//  Created by Raghu ram mahathi on 23/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit

@IBDesignable class CustomOfferView: UIView {

    @IBInspectable var fillColor: UIColor = UIColor(red: 16/255.0, green: 206/255.0, blue: 132/255.0, alpha: 1.0)
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 5)
        fillColor.setFill()
        path.fill()
    }

}
