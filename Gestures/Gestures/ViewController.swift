//
//  ViewController.swift
//  Gestures
//
//  Created by SunarcMac on 17/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewTapHere: UIView!
    @IBOutlet weak var lblTapHere: UILabel!
    
    @IBOutlet weak var viewDoubleTap: UIView!
    
    @IBOutlet weak var lblDoubleTap: UILabel!
    
    @IBOutlet weak var viewSwipe: UIView!
    @IBOutlet weak var lblSwipe: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap(gesture:)))
        viewTapHere.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTap(gesture:)))
        doubleTapGesture.numberOfTapsRequired = 2
        viewDoubleTap.addGestureRecognizer(doubleTapGesture)
        
        let left = UISwipeGestureRecognizer(target : self, action : #selector(self.leftSwipe))
        left.direction = .left
        self.viewSwipe.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(self.rightSwipe(gesture:)))
        right.direction = .right
        self.viewSwipe.addGestureRecognizer(right)
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
    }
    @objc func doubleTap(gesture: UITapGestureRecognizer) {
        print("Double tap called")
        self.lblDoubleTap.text = "I am Raghu Ram"
    }
    @objc func singleTap(gesture: UITapGestureRecognizer) {
        print("single tap called")
        self.lblTapHere.text = "Thanks for Tapping"
    }
    @objc func leftSwipe(){
        self.lblSwipe.backgroundColor = UIColor.blue
        self.lblSwipe.text = "You swiped Left"
        print("left")
    }
    @objc func rightSwipe(gesture: UISwipeGestureRecognizer) {
        self.lblSwipe.backgroundColor = UIColor.red
        self.lblSwipe.text = "You swiped Right"
        print("right")

    }
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            print("Screen edge swiped!")
        }
    }
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if recognizer.state == UIGestureRecognizer.State.ended {
            // 1
            let velocity = recognizer.velocity(in: self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            print("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
            
            // 2
            let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
            // 3
            var finalPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor),
                                     y:recognizer.view!.center.y + (velocity.y * slideFactor))
            // 4
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
            
            // 5
            UIView.animate(withDuration: Double(slideFactor * 2),
                           delay: 0,
                           // 6
                options: UIView.AnimationOptions.curveEaseOut,
                animations: {recognizer.view!.center = finalPoint },
                completion: nil)
        }
    }
    @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
}
extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
