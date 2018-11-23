//
//  Block.swift
//  NewCode
//
//  Created by SunarcMac on 02/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import Foundation

class Block{
    var blockName: String?
    var id: String?
    
    var arrBlock = [Block]()
    
    init(dict: [String: Any]) {
        self.blockName  = dict["block_name"] as? String
        self.id         = dict["id"] as? String
    }
    
    
    
}
