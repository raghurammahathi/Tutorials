//
//  Block.swift
//  CodableDecodable
//
//  Created by SunarcMac on 13/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation

class Block: Decodable {
    let id: String?
    let blockName: String?
    //let block_name: String?
    
    private enum CodingKeys : String, CodingKey {
        case id, blockName = "block_name"
    }
    
}
