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
    @IBOutlet weak var lblHideName: UILabel!
    @IBOutlet weak var lblHideAge: UILabel!
    @IBOutlet weak var lblHideMobile: UILabel!
    @IBOutlet weak var lblHideEmail: UILabel!
    @IBOutlet weak var lblHideAddress: UILabel!
    @IBOutlet weak var lblHideCountry: UILabel!
    @IBOutlet weak var lblHidePassword: UILabel!
    
    
    @IBOutlet weak var TFName: UITextField!
    @IBOutlet weak var TFAge: UITextField!
    @IBOutlet weak var TFMobile: UITextField!
    @IBOutlet weak var TFEmail: UITextField!
    @IBOutlet weak var TFAddress: UITextField!
    @IBOutlet weak var TFCountry: UITextField!
    @IBOutlet weak var TFPassword: UITextField!
    
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var btnCreateAccount: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        img.layer.cornerRadius = img.bounds.height/2
        img.clipsToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
        
        //setupView()
        // Register View Controller as Observer
//        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
        
    }
    
    
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case TFName:
            let (valid, message) = validate(textField)
            if valid {
                TFAge.becomeFirstResponder()
            }
            self.lblHideName.text = message
            UIView.animate(withDuration: 0.25, animations: {
                self.lblHideName.isHidden = valid
            })
        case TFAge:
            let (valid, message) = validate(textField)
            if valid {
                TFMobile.becomeFirstResponder()
            }
            self.lblHideAge.text = message
            UIView.animate(withDuration: 0.25, animations: {
                self.lblHideAge.isHidden = valid
            })
        case TFMobile:
            let (valid, message) = validate(textField)
            if valid {
                TFEmail.becomeFirstResponder()
            }
            self.lblHideMobile.text = message
            UIView.animate(withDuration: 0.25, animations: {
                self.lblHideMobile.isHidden = valid
            })
        case TFEmail:
            let (valid, message) = validate(textField)
            if valid {
                TFAddress.becomeFirstResponder()
            }
            self.lblHideEmail.text = message
            UIView.animate(withDuration: 0.25, animations: {
                self.lblHideEmail.isHidden = valid
            })
        case TFAddress:
            let (valid, message) = validate(textField)
            if valid {
                TFCountry.becomeFirstResponder()
            }
            self.lblHideAddress.text = message
            UIView.animate(withDuration: 0.25, animations: {
                self.lblHideAddress.isHidden = valid
            })
        case TFCountry:
            let (valid, message) = validate(textField)
            if valid {
                TFPassword.becomeFirstResponder()
            }
            self.lblHideCountry.text = message
            UIView.animate(withDuration: 0.25, animations: {
                self.lblHideCountry.isHidden = valid
            })
        case TFPassword:
            let (valid, message) = validate(textField)
            if valid {
                TFPassword.resignFirstResponder()
            }
            self.lblHidePassword.text = message
            UIView.animate(withDuration: 0.25, animations: {
                self.lblHidePassword.isHidden = valid
            })
        default: break
        }
        return true
    }
    
    fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
        guard let text = textField.text else {
            return (false, nil)
        }
        if textField == TFPassword {
            return (text.count >= 6, "Password is too short.")
        }
        return (text.count > 0, "This field cannot be empty.")
    }
//    fileprivate func setupView() {
//        // Configure Password Validation Label
//      //  lblHidePassword.isHidden = true
//
//        btnCreateAccount.isEnabled = false
//
//    }
    
    // MARK: - Notification Handling
    
//    @objc private func textDidChange(_ notification: Notification) {
//        var formIsValid = true
//
//        for textField in textFields {
//            // Validate Text Field
//            let (valid, _) = validate(textField)
//
//            guard valid else {
//                formIsValid = false
//                break
//            }
//        }
//
//        // Update Save Button
//        btnCreateAccount.isEnabled = formIsValid
//    }
}


