//
//  Block.swift
//  HttpClass
//
//  Created by SunarcMac on 19/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation
import RealmSwift

class Block: Object{
    @objc dynamic var blockName: String? = nil
    @objc dynamic var id: String? = nil
    
    
    //    var arrBlock = [Block]()
    
    convenience init(dict: [String: Any]) {
        self.init()
        self.blockName  = dict["block_name"] as? String
        self.id         = dict["id"] as? String
    }
    
    
    
}
