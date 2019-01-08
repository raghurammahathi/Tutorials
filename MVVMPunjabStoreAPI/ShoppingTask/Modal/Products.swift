//
//  Products.swift
//  ShoppingTask
//
//  Created by SunarcMac on 17/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import Foundation

enum HttpMethod: String {
     case GET, POST
}

class Products {
     
     var searchCriteria: [String: Any]?
     var totalCount: String?

     init(dict: [String: Any]) {
          
          self.totalCount = dict["total_count"] as? String
          self.searchCriteria = dict["search_criteria"] as? [String: Any]
    }

}

class SearchCriteria {
    
     var pagesize: String?
     var currentpage: String?
     
     init(dict: [String: Any]) {
          
     self.pagesize = dict["page_size"] as? String
     self.currentpage = dict["current_page"] as? String
          
     }
    
}

class ItemData {
    
     var name: String?
     var price: Int?
     var customAttributes = [CustomAttributes]()
     
     init(dict:[String: Any]) {
          
          self.name = dict["name"] as? String
          self.price = dict["price"] as? Int
          let customData = dict["custom_attributes"] as! [[String: Any]]
          
          for item in customData {
               
               let custom = CustomAttributes(dict: item)
               self.customAttributes.append(custom)
               
          }
     }
}

class CustomAttributes {
     
     var value: String?
     var attributeCode: String?
     
     init(dict: [String: Any]) {
          
          self.attributeCode = dict["attribute_code"] as? String
          self.value = dict["value"] as? String
          
          if self.attributeCode == "thumbnail" && self.value != nil{
               self.value = Constant.mediaPath + self.value!
          }
          
     }
}
