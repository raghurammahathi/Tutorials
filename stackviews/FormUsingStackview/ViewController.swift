//
//  ViewController.swift
//  FormUsingStackview
//
//  Created by Raghu ram mahathi on 01/12/18.
//  Copyright © 2018 Raghu ram mahathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        img.layer.cornerRadius = img.bounds.height/2
        img.clipsToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
    }


}

