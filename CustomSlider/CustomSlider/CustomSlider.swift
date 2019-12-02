//
//  CustomSlider.swift
//  CustomSlider
//
//  Created by Raghu ram mahathi on 28/11/19.
//  Copyright © 2019 raghu. All rights reserved.
//

import UIKit

class CustomSlider: UIControl{
    let shapeLayer = CAShapeLayer()

    var circularPath = UIBezierPath()
    var minimumValue = 0.0
    var maximumValue = 1.0
    var lowerValue = 0.2
    var upperValue = 0.8
    
    let lowerThumbLayer = CALayer()
    var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
  
    override func draw(_ rect: CGRect) {
        trackLayer()
        thumbLayer()

    }
 
   
    func trackLayer() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height), radius: self.frame.size.height/2, startAngle: -(CGFloat.pi * 150)/180, endAngle: -(CGFloat.pi * 30)/180, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        print(circularPath.currentPoint)
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10

        //shapeLayer.lineCap = .round
        self.layer.addSublayer(shapeLayer)
        circularPath.close()
        //circularPath.fill()
        //circularPath.addClip()
        //circularPath.close()
    }

    func thumbLayer() {
        lowerThumbLayer.backgroundColor = UIColor.yellow.cgColor
        
        
        
        lowerThumbLayer.frame = CGRect(x: 369, y: 281, width: 100, height: 100)
        lowerThumbLayer.setNeedsDisplay()
        shapeLayer.addSublayer(lowerThumbLayer)

    }

}
