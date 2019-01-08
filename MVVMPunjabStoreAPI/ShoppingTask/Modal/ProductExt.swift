//
//  ProductExt.swift
//  ShoppingTask
//
//  Created by SunarcMac on 17/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import Foundation


extension Products {
    

    
    class func getProducts(pageNumber: Int,_ success:@escaping (_ itemsArray: [ItemData]) -> Void,failed: @escaping (_ errorMessage: String) -> Void){
    
     
    
        HTTP.connection(API: Constant.productListing + "searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=2&searchCriteria[filter_groups][1][filters][0][field]=visibility&searchCriteria[filter_groups][1][filters][0][value]=4&searchCriteria[currentPage]=\(pageNumber)&searchCriteria[pageSize]=42", httpMethod: .GET, { (json) in
            
            var itemsArray = [ItemData]()
            
            if let result = json as? [String: Any]{

                let items = result["items"] as! [[String: Any]]
                for item in items {
                    
                    let itemData = ItemData(dict: item)
                    itemsArray.append(itemData)
                    print(itemsArray)
                }
                success(itemsArray)
                
            } else{
                print("something went wrong")
            }
            
        }) { (error) in
            failed(error)
        }
        
    }
}
