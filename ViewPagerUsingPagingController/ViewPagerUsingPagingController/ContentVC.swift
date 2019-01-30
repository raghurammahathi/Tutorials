//
//  ContentVC.swift
//  ViewPagerUsingPagingController
//
//  Created by Raghu ram mahathi on 24/01/19.
//  Copyright © 2019 Raghu ram mahathi. All rights reserved.
//

import UIKit


class ContentVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var pageIndex: Int = 0
    var strTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = strTitle
    }
    
}
