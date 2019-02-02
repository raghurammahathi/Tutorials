//
//  ViewController.swift
//  PaypalBraintree
//
//  Created by SunarcMac on 31/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import UIKit
import BraintreeDropIn
import Braintree


var braintreeClient: BTAPIClient?

class ViewController: UIViewController {

    @IBAction func onBtnTap(_ sender: Any) {
        //startCheckout()
        showDropIn(clientTokenOrTokenizationKey: "sandbox_k3g6xwwg_7hy8bbf6d6gcpc55")
    }

    func showDropIn(clientTokenOrTokenizationKey: String) {
        let request =  BTDropInRequest()
        let dropIn = BTDropInController(authorization: clientTokenOrTokenizationKey, request: request)
        { (controller, result, error) in
            if (error != nil) {
                print("ERROR")
                print(error!.localizedDescription)
            } else if (result?.isCancelled == true) {
                print("CANCELLED")
            } else if let nonce = result?.paymentMethod?.nonce {
                
                let deviceData = PPDataCollector.collectPayPalDeviceData()
                print("Send this device data to your server: \(deviceData)")
                self.postNonceToServer(paymentMethodNonce: nonce, deviceData: deviceData)
            }
            controller.dismiss(animated: true, completion: nil)
        }
        self.present(dropIn!, animated: true, completion: nil)
    }
    
    
    func postNonceToServer(paymentMethodNonce: String, deviceData: String) {
        // Update URL with your server
        
        print(deviceData)
        
        let paymentURL = URL(string: "http://")!
        var request = URLRequest(url: paymentURL)
        request.httpBody = "payment_method_nonce=\(paymentMethodNonce)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            guard let data = data else {
                print(error!.localizedDescription)
                return
            }
            
            guard let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let success = result?["success"] as? Bool, success == true else {
                print("Transaction failed. Please try again.")
                return
            }
            
            print("Successfully charged. Thanks So Much")
            
            }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    func startCheckout() {
//
//        braintreeClient = BTAPIClient(authorization: "sandbox_k3g6xwwg_7hy8bbf6d6gcpc55")!
//        let payPalDriver = BTPayPalDriver(apiClient: braintreeClient!)
//        payPalDriver.viewControllerPresentingDelegate = self
//        payPalDriver.appSwitchDelegate = self
//
//        let request = BTPayPalRequest()
//        request.billingAgreementDescription = "Your agremeent description" //Displayed in customer's PayPal account
//        payPalDriver.requestBillingAgreement(request) { (tokenizedPayPalAccount, error) -> Void in
//
//            let deviceData = PPDataCollector.collectPayPalDeviceData()
//            print("Send this device data to your server: \(deviceData)")
//
//            if let tokenizedPayPalAccount = tokenizedPayPalAccount {
//                print("Got a nonce: \(tokenizedPayPalAccount.nonce)")
//                // Send payment method nonce to your server to create a transaction
//
//                self.postNonceToServer(paymentMethodNonce: tokenizedPayPalAccount.nonce, deviceData: deviceData)
//            } else if let error = error {
//                print(error.localizedDescription)
//                // Handle error here...
//            } else {
//                print("Buyer canceled payment approval")
//                // Buyer canceled payment approval
//            }
//        }
//    }
    
}

extension ViewController: BTViewControllerPresentingDelegate, BTAppSwitchDelegate {

    
    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - BTAppSwitchDelegate
    
    
    // Optional - display and hide loading indicator UI
    func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
        showLoadingUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideLoadingUI), name: NSNotification.Name.NSExtensionHostDidBecomeActive, object: nil)
    }
    
    func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
        hideLoadingUI()
    }
    
    func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {
        
    }
    
    // MARK: - Private methods
    
    func showLoadingUI() {
        // ...
    }
    
    @objc func hideLoadingUI() {
        NotificationCenter
            .default
            .removeObserver(self, name: NSNotification.Name.NSExtensionHostDidBecomeActive, object: nil)
        // ...
    }
    
}
