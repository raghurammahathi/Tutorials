//
//  HTTP.swift
//  CodableDecodable
//
//  Created by SunarcMac on 13/02/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation

class HTTP {
    
    class func connection(API: String, httpMethod: String,_ success: @escaping (_ json: Any?)-> Void, failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        
        guard let url = URL(string: API) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                
                let block = try JSONDecoder().decode([Block].self, from: data)
                
                DispatchQueue.main.async {
                    success(block)
                }
            } catch let err {
                print(err)
            }
            
            }.resume()
    }
}
