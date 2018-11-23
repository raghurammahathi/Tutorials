//
//  Cat.swift
//  realmPractice
//
//  Created by SunarcMac on 27/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import Foundation
import RealmSwift


class Cat: Object {
    
    @objc dynamic var name: String?
    @objc dynamic var color: String?
    @objc dynamic var gender: String?
    
    
}
