//
//  ViewController.swift
//  Shapes
//
//  Created by SunarcMac on 28/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentDrawType = 0
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onRedrawTap(_ sender: Any) {
    
        currentDrawType += 1
        
        switch currentDrawType {
        case 0:
            drawRectangle()
        case 1:
            drawCircle()
        case 2:
            drawCheckerBoard()
        case 3:
            drawRotatedSquares()
            
        default:
            break
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawRectangle()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func drawRectangle(){
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 256, height: 256), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let rectangle = CGRect(x: 0, y: 0, width: 256, height: 256)
        context?.setFillColor(UIColor.red.cgColor)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(10)
        
        context?.addRect(rectangle)
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = img
    }
    func drawCircle(){
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 256, height: 256), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let rectangle = CGRect(x: 5, y: 5, width: 246, height: 246)
        context?.setFillColor(UIColor.red.cgColor)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(10)
        
        context?.addEllipse(in: rectangle)
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = img
        
    }
    func drawCheckerBoard(){
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 256, height: 256), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let rectangle = CGRect(x: 0, y: 0, width: 256, height: 256)
        context?.setFillColor(UIColor.black.cgColor)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineWidth(5)
        context?.addRect(rectangle)
        context?.drawPath(using: CGPathDrawingMode.stroke)
        
        for row in 0..<8 {
            for coloumn in 0..<8 {
                if row % 2 == 0{
                    if coloumn % 2 == 0{
                        context?.fill(CGRect(x: coloumn * 32, y: row * 32, width: 32, height: 32))
                        
                    }
                }else{
                    if coloumn % 2 == 1{
                        context?.fill(CGRect(x: coloumn * 32, y: row * 32, width: 32, height: 32))
                    }
                }
            }
        }
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = img
    }
    func drawRotatedSquares(){
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 256, height: 256), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        
        context?.translateBy(x: 128, y: 128)
        let rotations = 16
        let amount = (.pi/2) / Double(rotations)
        
        for _ in 0 ..< rotations {
            context?.rotate(by: CGFloat(amount))
            context?.addRect(CGRect(x: -64, y: -64, width: 128, height: 128))
        }
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.strokePath()
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = img
        
    }
}

