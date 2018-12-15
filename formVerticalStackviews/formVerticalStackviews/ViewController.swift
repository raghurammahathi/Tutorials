//
//  ViewController.swift
//  formVerticalStackviews
//
//  Created by SunarcMac on 15/12/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfMobile: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var lblNameValid: UILabel!
    @IBOutlet weak var lblAgeValid: UILabel!
    @IBOutlet weak var lblMobileValid: UILabel!
    @IBOutlet weak var lblEmailValid: UILabel!
    @IBOutlet weak var lblPasswordValid: UILabel!
    
    @IBOutlet var lblValidColl: [UILabel]!
    
    @IBAction func onSubmitBtnTap(_ sender: UIButton) {
        validate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func validate() {
        if tfName.text == "" {
            lblNameValid.isHidden = false
            lblAgeValid.isHidden = true
            lblMobileValid.isHidden = true
            lblEmailValid.isHidden = true
            lblPasswordValid.isHidden = true
            lblNameValid.text = "Please fill Name."
        }else if tfAge.text == "" {
            lblNameValid.isHidden = true
            lblAgeValid.isHidden = false
            lblMobileValid.isHidden = true
            lblEmailValid.isHidden = true
            lblPasswordValid.isHidden = true
            lblAgeValid.text = "Please fill Age."
        }else if tfMobile.text == "" {
            lblNameValid.isHidden = true
            lblAgeValid.isHidden = true
            lblMobileValid.isHidden = false
            lblEmailValid.isHidden = true
            lblPasswordValid.isHidden = true
            lblMobileValid.text = "Please fill Mobile Number."
        }else if tfEmail.text == "" {
            lblNameValid.isHidden = true
            lblAgeValid.isHidden = true
            lblMobileValid.isHidden = true
            lblEmailValid.isHidden = false
            lblPasswordValid.isHidden = true
            lblEmailValid.text = "Please fill Email."
        }else if tfPassword.text == "" {
            lblNameValid.isHidden = true
            lblAgeValid.isHidden = true
            lblMobileValid.isHidden = true
            lblEmailValid.isHidden = true
            lblPasswordValid.isHidden = false
            lblPasswordValid.text = "Please fill Password."
        }else{
            lblNameValid.isHidden = true
            lblAgeValid.isHidden = true
            lblMobileValid.isHidden = true
            lblEmailValid.isHidden = true
            lblPasswordValid.isHidden = true
            print("Account Created")
        }
    }
}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case tfName:
            tfAge.becomeFirstResponder()
        case tfAge:
            tfMobile.becomeFirstResponder()
        case tfMobile:
            tfEmail.becomeFirstResponder()
        case tfEmail:
            tfPassword.becomeFirstResponder()
        default:
            tfPassword.resignFirstResponder()

        }
        return true
    }
}
