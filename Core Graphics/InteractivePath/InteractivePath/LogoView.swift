//
//  LogoView.swift
//  InteractivePath
//
//  Created by SunarcMac on 28/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

protocol LogoTraceDelegate {
    func logoTraceComplete()
}


@IBDesignable
class LogoView: UIView {
    
    var yPositionPercentage:CGFloat = 0
    var traceCompleted = false
    @IBInspectable var color: UIColor = UIColor.black
    //@IBInspectable var gradientColor: UIColor = UIColor.yellow
    @IBInspectable var gradientColor = UIColor(red: 0.157, green: 0.169, blue: 0.208, alpha: 1.000)
    @IBInspectable var gradientColor2 = UIColor(red: 0.498, green: 0.498, blue: 0.620, alpha: 1.000)


    var delegate:LogoTraceDelegate?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
                
        let context = UIGraphicsGetCurrentContext()!


        let gradient = CGGradient(colorsSpace: nil, colors: [gradientColor.cgColor, gradientColor2.cgColor] as CFArray, locations: [0, 1])!
        let rectanglePath = UIBezierPath(rect: CGRect(x: 1, y: 1, width: 63, height: 213))
        context.saveGState()
        rectanglePath.addClip()
        context.drawLinearGradient(gradient, start: CGPoint(x: 32.5, y: 1), end: CGPoint(x: 32.5, y: self.frame.height * yPositionPercentage), options: [])
        context.restoreGState()
        color.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchPoint = touches.first?.location(in: self) {
            yPositionPercentage = touchPoint.y / self.frame.size.height
            updateDrawing()
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateDrawing()
        if yPositionPercentage >= 1 {
            traceCompleted = true
            if delegate != nil {
                delegate?.logoTraceComplete()
            }
        }
    }
    
    func updateDrawing () {
        
        if !traceCompleted {
            if yPositionPercentage > 0 && yPositionPercentage < 1 {
                self.setNeedsDisplay()
            }
        }
    }
}
