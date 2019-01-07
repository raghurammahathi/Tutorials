//
//  ExtBlock.swift
//  NewCode
//
//  Created by SunarcMac on 02/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import Foundation

extension Block {
   

    class func getBlocks(_ success:@escaping (_ blocks: [Block]) -> Void,failed: @escaping (_ errorMessage: String) -> Void){
       
        HTTP.connection(API: "http://13.228.97.103/rest/V1/block/list", httpMethod: "GET", { (json) in
            
            if let data = json as? [[String: Any]] {
                var blocks = [Block]()
                for dict in data {
                    let block = Block(dict: dict)
                    blocks.append(block)
                }
                success(blocks)
            } else {
                failed("Somthing went wrong")
            }
            
            
        }) { (error) in
            failed(error)
        }
        
    }
    
}
