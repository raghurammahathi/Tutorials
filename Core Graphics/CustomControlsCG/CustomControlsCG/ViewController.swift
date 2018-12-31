//
//  ViewController.swift
//  CustomControlsCG
//
//  Created by SunarcMac on 31/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var submitBtn: CustomButton!
    
    @IBOutlet weak var clickBtn: roundButton!
    
    @IBOutlet weak var customView: GradientView!
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        submitBtn.layer.shadowOpacity = 0.7
        submitBtn.layer.shadowRadius = 2.5
        submitBtn.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        clickBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        clickBtn.layer.shadowOpacity = 0.7
        clickBtn.layer.shadowRadius = 2.5
        clickBtn.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        // Do any additional setup after loading the view, typically from a nib.
        customView.layer.shadowOffset = CGSize(width: 5, height: 5)
        customView.layer.shadowOpacity = 0.7
        customView.layer.shadowRadius = 2.5
        customView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
    }


}

