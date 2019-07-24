//
//  Block.swift
//  HttpClass
//
//  Created by SunarcMac on 19/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation
import RealmSwift

//class Block: Object{
//    @objc dynamic var blockName: String? = nil
//    @objc dynamic var id: String? = nil
//
//
//    //    var arrBlock = [Block]()
//
//    convenience init(dict: [String: Any]) {
//        self.init()
//        self.blockName  = dict["block_name"] as? String
//        self.id         = dict["id"] as? String
//    }
//
//
//
//}

class Block: Object {
    
    var page =  RealmOptional<Int>()
    let data = List<DataModel>()

    func initWithJSON(dict: [String: Any]) {
        
        self.page.value   = dict["page"] as? Int
        if let data = dict["data"] as? [[String: Any]] {
            for i in data {
                let data = DataModel()
                data.initWithJSON(dict: i)
                self.data.append(data)
            }
        }

    }
    
    override static func primaryKey() -> String? {
        return "page"
    }
}

class DataModel: Object {
    
    @objc dynamic var firstName: String? = nil
    @objc dynamic var lastName: String? = nil
    var id =  RealmOptional<Int>()
    let data = LinkingObjects(fromType: Block.self, property: "data")
    
    func initWithJSON(dict: [String: Any]) {
        
        self.firstName = dict["first_name"] as? String
        self.lastName = dict["last_name"] as? String
        self.id.value   = dict["id"] as? Int

    }
    override static func primaryKey() -> String? {
        return "id"
    }
}
