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
        
        HTTP().connectionWithoutRequestObject(api: "http://13.228.97.103/rest/V1/block/list", parameters: nil, method: .get, indicator: false, success: { (json) in
            try! realm.write {
                realm.deleteAll()
            }
                        if let data = json as? [[String: Any]] {
                            //  var blocks = [Block]()
                            for dict in data {
                                let block = Block(dict: dict)
                                //blocks.append(block)
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
        
        
//        HTTP.connection(API: "http://13.228.97.103/rest/V1/block/list", httpMethod: "GET", { (json) in
//            try! realm.write {
//                realm.deleteAll()
//            }
//
//            if let data = json as? [[String: Any]] {
//                //  var blocks = [Block]()
//                for dict in data {
//                    let block = Block(dict: dict)
//                    //blocks.append(block)
//                    try! realm.write {
//                        realm.add(block)
//                    }
//                }
//                let dataFromDB = realm.objects(Block.self)
//                print(dataFromDB)
//                blocks = Array(dataFromDB)
//                print(blocks)
//                success(blocks)
//            } else {
//                failed("Somthing went wrong", [])
//            }
//        }) { (error) in
//            failed(error, blocks)
//        }
        
    }
    
    
}
