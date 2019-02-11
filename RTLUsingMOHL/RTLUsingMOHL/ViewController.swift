//
//  ViewController.swift
//  RTLUsingMOHL
//
//  Created by SunarcMac on 08/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit
import MOLH

class ViewController: UIViewController {

    @IBOutlet weak var arrowImg: UIImageView!
    @IBAction func onBtntap(_ sender: Any) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset()
       // arrowImg.image?.flipIfNeeded()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

