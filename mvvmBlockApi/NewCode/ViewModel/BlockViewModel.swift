//
//  BlockViewModel.swift
//  NewCode
//
//  Created by SunarcMac on 07/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation
class BlockViewModel{
   
    var blockName: String?
    var id: String?
    
    init(block: Block) {
        self.blockName = block.blockName
        self.id = block.id
    }
    
}
