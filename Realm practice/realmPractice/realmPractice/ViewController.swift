//
//  ViewController.swift
//  realmPractice
//
//  Created by SunarcMac on 27/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

       print(Realm.Configuration.defaultConfiguration.fileURL)
        store()
        retrive()
    }

    func store(){
        let myCat = Cat()
            myCat.name = "Hem"
            myCat.gender = "male"
            myCat.color = "blue"
        
            try! realm.write {
        
                realm.add(myCat)
        
                }
        
    }
    
    func retrive(){
        
        let results = realm.objects(Cat.self).filter("name = 'tom'")
        print(results.count)
        
        
    }
}

