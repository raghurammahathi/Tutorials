//
//  ViewController.swift
//  practice
//
//  Created by Raghu ram mahathi on 23/12/19.
//  Copyright © 2019 raghu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //var isCallPresent: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onBtnTap(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC")
        secondVC?.modalPresentationStyle = .formSheet
        secondVC?.modalPresentationStyle = .overCurrentContext
        secondVC?.modalTransitionStyle = .crossDissolve
        self.present(secondVC!, animated: true, completion: nil)

    }
    
}

