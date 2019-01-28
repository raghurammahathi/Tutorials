//
//  OneViewController.swift
//  viewPagerIos
//
//  Created by Raghu ram mahathi on 26/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      //  view.backgroundColor = UIColor.orange
        
//        let newView = UIView()
//        newView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        newView.backgroundColor = UIColor.gray
//        view.addSubview(newView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let newView2 = UIView()
        newView2.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        newView2.backgroundColor = UIColor.orange
        view.addSubview(newView2)
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
