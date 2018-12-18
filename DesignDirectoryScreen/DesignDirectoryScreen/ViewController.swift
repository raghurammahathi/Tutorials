//
//  ViewController.swift
//  DesignDirectoryScreen
//
//  Created by SunarcMac on 18/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var imgCallIcon: UIView!
    @IBOutlet weak var imgMsgIcon: UIView!
    @IBOutlet weak var imgSaveIcon: UIView!
    @IBOutlet weak var imgCopyIcon: UIView!
    @IBOutlet weak var tableContact: UITableView!
    
    let contactTypes = ["Personal Number", "Alternate Number", "Extension Number"]
    let contactNumbers = ["9985859871","9182219940","123456789"]
    override func viewDidLoad() {
        super.viewDidLoad()
        imgProfile.layer.cornerRadius = imgProfile.bounds.height/2
        imgProfile.clipsToBounds = true

        imgCallIcon.layer.cornerRadius = imgCallIcon.bounds.height/2
        imgCallIcon.clipsToBounds = true
        
        imgMsgIcon.layer.cornerRadius = imgMsgIcon.bounds.height/2
        imgMsgIcon.clipsToBounds = true
        
        imgSaveIcon.layer.cornerRadius = imgSaveIcon.bounds.height/2
        imgSaveIcon.clipsToBounds = true
        
        imgCopyIcon.layer.cornerRadius = imgCopyIcon.bounds.height/2
        imgCopyIcon.clipsToBounds = true
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell")as! ContactCell
        let row = indexPath.row
        cell.lblContactType.text = contactTypes[row]
        cell.lblContactNumbers.text = contactNumbers[row]
        return cell
    }
}
class ContactCell: UITableViewCell {
    @IBOutlet weak var lblContactType: UILabel!
    @IBOutlet weak var lblContactNumbers: UILabel!
 
}

    

