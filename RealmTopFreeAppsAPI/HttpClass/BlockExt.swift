//
//  BlockExt.swift
//  HttpClass
//
//  Created by SunarcMac on 19/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation
import RealmSwift

extension Block {
    
    
    class func getBlocks(_ success:@escaping (_ blocks: [Block]) -> Void,failed: @escaping (_ errorMessage: String,_ block: [Block]) -> Void){
        
        let realm = try! Realm()
        var blocks = [Block]()
        
        HTTP().connectionWithoutRequestObject(api: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/10/explicit.json", parameters: nil, method: .get, indicator: false, success: { (json) in
            try! realm.write {
                realm.deleteAll()
            }
            
            let data = json as! [String: Any]
            let feed = data["feed"] as! [String: Any]
            if let results = feed["results"] as? [[String: Any]] {
                
            print(results)
            
            
            
            for dict in results {
                let block = Block(dict: dict)
                    try! realm.write {
                        realm.add(block)
                        }
                }
                let dataFromDB = realm.objects(Block.self)
                print(dataFromDB)
                blocks = Array(dataFromDB)
                print(blocks)
                success(blocks)
                } else {
                failed("Somthing went wrong", blocks)
                }
    
            
        }) { (error) in
            let dataFromDB = realm.objects(Block.self)
            print(dataFromDB)
            blocks = Array(dataFromDB)
            print(blocks)
            failed(error, blocks)
        }

        
    }
    
    
}
