//
//  ViewController.swift
//  InteractivePath
//
//  Created by SunarcMac on 28/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LogoTraceDelegate {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var traceView: LogoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        traceView.delegate = self
    }
    
    
    func logoTraceComplete() {
        statusLabel.text = "I am Raghu"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

