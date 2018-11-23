//
//  ViewController.swift
//  PlayingWithClosures
//
//  Created by SunarcMac on 02/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var volume = 0.0
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    
    @IBAction func presentAlert(_ sender: Any) {
        volume = 240.0
        let alert = UIAlertController(
            title: "Alert",
            message: "Volume is \(volume)",
            preferredStyle: .alert)
        
        let clearAction = UIAlertAction(
            title: "Clear", style: .destructive,
            handler: {(action)->() in
                self.volume = 0
                
                self.resultsLabel.text = "\(self.volume)"
        })
        
        let doubleAction = UIAlertAction(
            title: "Double",
            style: .default,
            handler: {(action)->() in
                self.volume *= 2
                self.resultsLabel.text = "\(self.volume)"
        })
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler:{(action)->() in
                self.resultsLabel.text = "\(self.volume)"
        })
        
        
        alert.addAction(clearAction)
        alert.addAction(doubleAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: {()->Void in
            print ("Inside Handler")
        })
        print ("Outside Handler")
        
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        let names = ["Raghu", "Ram", "mahathi", "raju", "anand"]
        
       var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print(reversedNames)
        
        
        let myClosure = { (number: Int) -> Int in
            let result = 3 * number
            return result
        }
        
       print(myClosure(5))
    
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    
  

}

