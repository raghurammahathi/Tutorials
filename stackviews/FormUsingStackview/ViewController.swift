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
        
        setupView()
        // Register View Controller as Observer
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
        
    }
    
    
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case TFName:
            TFAge.becomeFirstResponder()
        case TFAge:
            TFMobile.becomeFirstResponder()
        case TFMobile:
            TFEmail.becomeFirstResponder()
        case TFEmail:
            TFAddress.becomeFirstResponder()
        case TFAddress:
            TFCountry.becomeFirstResponder()
        case TFCountry:
            TFPassword.becomeFirstResponder()
        case TFPassword:
            // Validate Text Field
            let (valid, message) = validate(textField)
            
            if valid {
            }
            
            // Update Password Validation Label
            self.lblHidePassword.text = message
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.lblHidePassword.isHidden = valid
            })
            TFPassword.resignFirstResponder()
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
    fileprivate func setupView() {
        // Configure Password Validation Label
        lblHidePassword.isHidden = true
        
        btnCreateAccount.isEnabled = false
        
    }
    
    // MARK: - Notification Handling
    
    @objc private func textDidChange(_ notification: Notification) {
        var formIsValid = true
        
        for textField in textFields {
            // Validate Text Field
            let (valid, _) = validate(textField)
            
            guard valid else {
                formIsValid = false
                break
            }
        }
        
        // Update Save Button
        btnCreateAccount.isEnabled = formIsValid
    }
}


