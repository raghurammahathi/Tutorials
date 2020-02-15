//
//  ViewController.swift
//  CustomSlider
//
//  Created by Raghu ram mahathi on 28/11/19.
//  Copyright © 2019 raghu. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    @IBOutlet weak var slider: SliderView!
    
//    var bezierPath = UIBezierPath()
//    var p0 = CGPoint()
//    var p1 = CGPoint()
//    var p2 = CGPoint()
//    var bezierPathYMax = CGFloat()
//    var emojiCenter = CGPoint()
//
//    var emojiView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.progress = CGPoint(x: 333, y: 83)
        print(slider.progress)
        slider.emojiView.image = UIImage(named: "edit")
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged )
        
//        emojiView.frame = CGRect(x: 0, y: 0, width: 10, height: 30)
//        emojiView.image = UIImage(named: "img")
//        view.addSubview(emojiView)
//
//        p0.x = 50
//        p0.y = view.frame.height - 100
//
//        p2.x = view.frame.width - 50
//        p2.y = view.frame.height - 100
//
//        p1.x = view.frame.width/2
//        p1.y = view.frame.width + 300
//
//        drawBezierPath()
//        let dragPan = UIPanGestureRecognizer(target: self, action: #selector(dragEmotionOnBezier(recognizer:)))
//        view.addGestureRecognizer(dragPan)
        
    }
    
    @objc func sliderChanged(){
        print(slider.progress)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        //set the emojiView center at random point on Bezier path. Setting the starting point here
//        emojiView.center = p0
//        //store the initial position of emoji
//        emojiCenter = p0
//    }
    
    /*
     Draw BezierPath Quad curve and get the path.
     */
//    func drawBezierPath() {
//
//        let maxLeftPoint = emojiView.center
//
//
//        bezierPath.move(to: p0)
//        bezierPath.addQuadCurve(to: p2, controlPoint: p1)
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = bezierPath.cgPath
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.lineWidth = 5.0
//        shapeLayer.lineCap = .round
//        view.layer.addSublayer(shapeLayer)
//        emojiView.translatesAutoresizingMaskIntoConstraints = false
//
//        //Store the max Y distance covered by UIBeziurePath. It will be useful to calculate the intermidiate point on curve
//        // at the distance y from the start point po
//        bezierPathYMax = p2.x - p0.x
//
//    }
    
    
//    func halfPoint1D(p0: CGFloat, p2: CGFloat, control: CGFloat) -> CGFloat {
//        return 2 * control - p0 / 2 - p2 / 2
//    }

//    func getPointAtPercent(t: Float, start: Float, c1: Float, end: Float ) -> Float {
//        let t_: Float = (1.0 - t)
//        let tt_: Float = t_ * t_
//        let tt: Float = t * t
//
//        return start * tt_
//            + 2.0 * c1 * t_ * t
//            + end * tt
//    }
    
    
//    @objc func dragEmotionOnBezier(recognizer: UIPanGestureRecognizer) {
//        let point = recognizer.location(in: view)
//        let distanceY = point.x - emojiCenter.x
//        // get the value between 0 & 1. 0 represents and po and 1 represents p2.
//        var distanceYInRange = distanceY / bezierPathYMax
//        distanceYInRange = distanceYInRange > 0 ? distanceYInRange : -distanceYInRange
//        if distanceYInRange >= 1 || distanceYInRange <= 0 {
//            // already at the end of the curve. So need to drag
//            return
//        }
//        // get the x,y point on the beziere path at a distance distanceYInRange from p0.
//        let newY = getPointAtPercent(t: Float(distanceYInRange), start: Float(p0.y) , c1: Float(p1.y), end: Float(p2.y))
//        let newX = getPointAtPercent(t: Float(distanceYInRange), start: Float(p0.x) , c1: Float(p1.x), end: Float(p2.x))
//        
//        // set the newLocation of the emojiview
//        emojiView.center = CGPoint(x: CGFloat(newX), y: CGFloat(newY))
//    }
}

