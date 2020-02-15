//
//  SliderView.swift
//  CustomSlider
//
//  Created by Raghu ram mahathi on 29/12/19.
//  Copyright © 2019 raghu. All rights reserved.
//

import UIKit


@IBDesignable class SliderView: UIControl {
    
    var progress = CGPoint(){
        didSet{
            updateFrames()
        }
    }
    
    var p0 = CGPoint()
    var p1 = CGPoint()
    var p2 = CGPoint()

    var newX = CGFloat()
    var newY = CGFloat()
    
    var bezierPath = UIBezierPath()
    let shapeLayer = CAShapeLayer()

    @IBInspectable var startPoint: CGPoint = CGPoint(x: 50, y: 75) {
        didSet {
            p0.x = startPoint.x
            p0.y = startPoint.y
        }
    }
    @IBInspectable var middlePoint: CGPoint = CGPoint(x: 175/2, y: 5) {
        didSet {
            p1.x = middlePoint.x
            p1.y = middlePoint.y
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 325, y: 75) {
        didSet {
            p2.x = endPoint.x
            p2.y = endPoint.y
        }
    }
    
    var bezierPathYMax = CGFloat()
    var emojiCenter = CGPoint()
    
    var emojiView = UIImageView()
    
    @IBInspectable var image: UIImage? {
        didSet{
            emojiView.image = image
        }
    }
    @IBInspectable var sliderColor: UIColor? {
        didSet{
            shapeLayer.strokeColor = sliderColor?.cgColor
        }
    }
    @IBInspectable var sliderHeight: CGFloat = 5.0 {
        didSet{
            shapeLayer.lineWidth = sliderHeight
        }
    }
   
    override func layoutSubviews() {
//        emojiView.frame = CGRect(x: 0, y: 0, width: bounds.height - 165, height: bounds.height - 145)
        //emojiView.contentMode = .scaleAspectFit

    }
    override func draw(_ rect: CGRect) {
        emojiView.image = UIImage(named: "edit")
        emojiView.frame = CGRect(origin: CGPoint(x: p0.x, y: p0.y), size: CGSize(width: 30, height: 30))

        self.addSubview(emojiView)
        
//        p0.x = 50
        p0.y = self.frame.height - 100
        
        p2.x = self.frame.width - 50
        p2.y = self.frame.height - 100
        
        p1.x = self.frame.width/2
//        p1.y = 5
        
        drawBezierPath()
        let dragPan = UIPanGestureRecognizer(target: self, action: #selector(dragEmotionOnBezier(recognizer:)))
        self.addGestureRecognizer(dragPan)
        
        emojiView.center = p0
        //store the initial position of emoji
        emojiCenter = p0
    }
    

    func updateFrames() {
        emojiView.center = CGPoint(x: newX, y: newY)
        print(emojiView.center)
    }
    
    
    func drawBezierPath() {
        
        let maxLeftPoint = emojiView.center
        
        
        bezierPath.move(to: p0)
        bezierPath.addQuadCurve(to: p2, controlPoint: p1)
        shapeLayer.lineWidth = sliderHeight
        shapeLayer.strokeColor = sliderColor?.cgColor

        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        self.layer.addSublayer(shapeLayer)
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        
        //Store the max Y distance covered by UIBeziurePath. It will be useful to calculate the intermidiate point on curve
        // at the distance y from the start point po
        bezierPathYMax = p2.x - p0.x
        
    }
    
    func halfPoint1D(p0: CGFloat, p2: CGFloat, control: CGFloat) -> CGFloat {
        return 2 * control - p0 / 2 - p2 / 2
    }
    
    func getPointAtPercent(t: Float, start: Float, c1: Float, end: Float ) -> Float {
        let t_: Float = (1.0 - t)
        let tt_: Float = t_ * t_
        let tt: Float = t * t
        
        return start * tt_
            + 2.0 * c1 * t_ * t
            + end * tt
    }
    
    
    @objc func dragEmotionOnBezier(recognizer: UIPanGestureRecognizer) {
        let point = recognizer.location(in: self)
        let distanceY = point.x - emojiCenter.x
        // get the value between 0 & 1. 0 represents and po and 1 represents p2.
        var distanceYInRange = distanceY / bezierPathYMax
        distanceYInRange = distanceYInRange > 0 ? distanceYInRange : -distanceYInRange
        if distanceYInRange >= 1 || distanceYInRange <= 0 {
            // already at the end of the curve. So need to drag
            return
        }
        // get the x,y point on the beziere path at a distance distanceYInRange from p0.
        newY = CGFloat(getPointAtPercent(t: Float(distanceYInRange), start: Float(p0.y) , c1: Float(p1.y), end: Float(p2.y)))
        newX = CGFloat(getPointAtPercent(t: Float(distanceYInRange), start: Float(p0.x) , c1: Float(p1.x), end: Float(p2.x)))
        
        // set the newLocation of the emojiview
        emojiView.center = CGPoint(x: CGFloat(newX), y: CGFloat(newY))
        self.progress = CGPoint(x: newX, y: newY)
        
        self.sendActions(for: UIControl.Event.valueChanged)

    }


}
