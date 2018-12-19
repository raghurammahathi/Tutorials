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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return contactTypes.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell")as! ContactCell
        let row = indexPath.row
        cell.lblContactType.text = contactTypes[row]
        cell.lblContactNumbers.text = contactNumbers[row]
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell")as! AddressCell
            cell.lblAddress.text = "Address :"
            cell.lblAddressValue.text = "isrgjp'orgjmrp'gojmvojsdfviknsadgarfgrerfgerfgedfgredghijulghktydjthjtdyjtuyktuytyhuuhkguhuhkyuhkuhkyujkuyd"
            return cell
        default:
            return UITableViewCell()
        }
    }
}
class ContactCell: UITableViewCell {
    @IBOutlet weak var lblContactType: UILabel!
    @IBOutlet weak var lblContactNumbers: UILabel!
 
}

class AddressCell: UITableViewCell {
   
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblAddressValue: UILabel!
}

