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
        
        HTTP().connectionWithoutRequestObject(api: "https://reqres.in/api/users?page=2", parameters: nil, method: .get, indicator: false, success: { (json) in
            try! realm.write {
                realm.deleteAll()
            }
            
            
            print(json)
            if let dic = json as? [String: Any] {
            print(dic)
            let j = Block()
            j.initWithJSON(dict: dic)
            print(j)
            try! realm.write {
                realm.add(j)
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
