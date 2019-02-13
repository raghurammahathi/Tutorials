//
//  BlockExt.swift
//  CodableDecodable
//
//  Created by SunarcMac on 13/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation
extension Block {
    
    
    class func getBlocks(_ success:@escaping (_ blocks: [Block]) -> Void,failed: @escaping (_ errorMessage: String) -> Void){
        
        HTTP.connection(API: "http://13.228.97.103/rest/V1/block/list", httpMethod: "GET", { (json) in
            
            if let data = json as? [Block]{
                success(data)
                print(data)
            }
        }) { (error) in
            failed(error)
        }
    }
}
