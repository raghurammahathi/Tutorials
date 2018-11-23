//
//  HTTP.swift
//  ShoppingTask
//
//  Created by SunarcMac on 17/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import Foundation

class HTTP {
    
    
    class func connection(API: String, httpMethod: HttpMethod,_ success: @escaping (_ json: Any?)-> Void, failure: @escaping (_ errorMessage: String) -> ()) -> Void {
    
    
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        var urlRequest = URLRequest(url: URL(string: API)! )
        urlRequest.httpMethod = httpMethod.rawValue
        
        
        
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                DispatchQueue.main.async {
                    success(responseJSON)
                }
            } catch {
                DispatchQueue.main.async {
                    failure(error.localizedDescription)
                }
            }
        })
        dataTask.resume()
        
    }
    
}
