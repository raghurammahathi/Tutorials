//
//  TabsCell.swift
//  viewPagerIos
//
//  Created by Raghu ram mahathi on 29/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit

class TabsCell: UICollectionViewCell {

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var namesLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        widthConstraint.constant = screenWidth - (2*1)
        // Initialization code
    }

}
