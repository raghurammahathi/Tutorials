//
//  ItemViewModel.swift
//  ShoppingTask
//
//  Created by SunarcMac on 08/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation

class ItemViewModel {
    
    var name: String?
    var price: Int?
    var customAttributes = [CustomAttributes]()
    init(items:ItemData) {
        
        self.name = items.name
        self.price = items.price
        self.customAttributes = items.customAttributes
        
    }
}

