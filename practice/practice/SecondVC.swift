//
//  SecondVC.swift
//  practice
//
//  Created by Raghu ram mahathi on 23/12/19.
//  Copyright © 2019 raghu. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var isCallPresent: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(_ sender: Any) {
        if isCallPresent==true{
            
        }else{
        self.dismiss(animated: true, completion: nil)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
