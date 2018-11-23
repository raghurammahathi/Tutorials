//
//  HTTP.swift
//  NewCode
//
//  Created by SunarcMac on 02/10/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import Foundation

class HTTP {
    
    class func connection(API: String, httpMethod: String,_ success: @escaping (_ json: Any?)-> Void, failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        var urlRequest = URLRequest(url: URL(string: API)! )
        urlRequest.httpMethod=httpMethod
        
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                DispatchQueue.main.async {
                    success(responseJSON)
                }
            } catch {
                DispatchQueue.main.async {
                    failure(error.localizedDescription) // you forgot this
                }
            }
        })
        dataTask.resume()
        
    }
    
}

