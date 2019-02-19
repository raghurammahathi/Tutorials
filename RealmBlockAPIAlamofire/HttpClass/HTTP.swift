//
//  HTTP.swift
//  HttpClass
//
//  Created by SunarcMac on 02/01/19.
//  Copyright © 2019 SunarcMac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class HTTP: NSObject {
    var url = ""
    var api = ""
    private func connectWithRequestObject(api: String, parameters: Any?, method: HTTPMethod, contentType: String, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if indicator == true {
        }
        
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20
      //  let bearer = User().bearerToken
      //  if bearer != nil {
         //   request.setValue("Bearer \(User().bearerToken!)", forHTTPHeaderField: "Authorization" )
            
            
     //   }

        
        if parameters != nil {
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters!)
            print(parameters ?? "")
        }
        
      //  print(API.API_PREFIX + api)
        print(method)
        print(parameters ?? "Parameter not available")
      //  print(request.allHTTPHeaderFields)
        
        Alamofire.request(request).responseJSON { response in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(response)
            if response.response == nil {
                failure("No network found")
            }
            
            if response.response?.statusCode == 200{
                if response.result.value != nil {
                    success(response.result.value!)
                }else{
                    failure("Server not responding")
                }
            } else {
                if let result = response.result.value{
                    if let json = result as? [String: Any] {
                        
                        guard let message = json["message"] as? String else{
                            failure("Unknown error found")
                            return
                        }
                        failure(message)
                    }
                }else {
                    failure("Unknown error found")
                }
            }
            
        }
        
    }
    
    
    
    private func connectWithoutRequestObject(api: String, parameters: Any?, method: HTTPMethod, contentType: String, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        
        var headers: HTTPHeaders = HTTPHeaders()
        
        headers["Content-Type"] = contentType
//        if let token = User().bearerToken {
//            headers["Authorization"] = "Bearer ba2o2hniyqxmoxokmu1ej7bo48uaqvoe"
//        }
        
       // print(API.API_PREFIX + api)
        print(method)
       // print(parameters!)
        print(headers)
        print(contentType)
        
        var parms = parameters as? [String: Any]
        
//        if parms!["comment"] == nil{
//            if defaults.object(forKey: "storeId") != nil{
//                parms!["storeId"] = defaults.object(forKey: "storeId") as? String
//            }else {
//                parms!["storeId"] = "1"
//            }
//        }
        
//        print(parms!)
        Alamofire.request(api,method: method,parameters:parms,headers: headers).validate().responseJSON { response in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(response)
            if response.response == nil {
                failure("No network found")
            }
            
            if response.response?.statusCode == 200{
                if response.result.value != nil {
                    success(response.result.value!)
                }else{
                    failure("Server not responding")
                }
            } else {
                if let result = response.result.value{
                    if let json = result as? [String: Any] {
                        
                        guard let message = json["message"] as? String else{
                            failure("Unknown error found")
                            return
                        }
                        failure(message)
                    }
                }else {
                    failure("Unknown error found")
                }
            }
            
            
        }
        
    }
    
    
    private func multipartUpload(api: String, keyValueDict: [String: Any]?, keyValueFile: [String: Any]?, method: HTTPMethod, contentType: String, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        
        // build header
        var headers: HTTPHeaders = HTTPHeaders()
        headers["Content-Type"] = "application/json"
//        if let token = User().bearerToken {
//            headers["Authorization"] = "Bearer \(token)"
//        }
        if let authKey = UserDefaults.standard.value(forKey: "authKey") as? String {
            headers["authKey"] = authKey
        }
        
      //  print(HOST_NAME + api)
        print(method)
        print(keyValueDict ?? "No parameters")
        print(keyValueFile ?? "No files")
        print(headers)
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData: MultipartFormData) in
            // 1. Add key values dict
            if let keyValueDict_ = keyValueDict {
                
                for (key, value) in keyValueDict_ {
                    print(key, value)
                    
                    if let valueAsData = "\(value)".data(using: .utf8, allowLossyConversion: false) {
                        multipartFormData.append(valueAsData, withName: key)
                    }
                }
            }
            
            // 2. Add files
            if let keyValueFile_ = keyValueFile {
                for (key, value) in keyValueFile_ {
                    
                    print(key, value)
                    
                    if let fileLocalPath = value as? String {
                        let photourl = URL(string: fileLocalPath)
                        let fileData = try! Data(contentsOf: photourl!)
                        multipartFormData.append(fileData, withName: key, fileName: "file.png", mimeType: "")
                    }
                    
                }
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold,
           to:api,
           method: method,
           headers: headers) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON(completionHandler: { (dataResponse: DataResponse) in
                    do {
                        if let data = dataResponse.data {
                            
                            
                           // let sringFromData = String(bytes: data, encoding: .utf8)
                          //  print(sringFromData)
                            
                            let response = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                            print(response)
                            success(response)
                            
                        } else {
                            failure("No response from server")
                        }
                    }
                    catch {
                        print(error.localizedDescription)
                        failure(error.localizedDescription)
                    }
                })
            case .failure(let encodingError):
                failure(encodingError.localizedDescription)
            }
        }
    }
    
    
    func connectionWithRequestObject(api: String, parameters: Any?, method: HTTPMethod, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        self.connectWithRequestObject(api: api, parameters: parameters, method: method, contentType: "application/json", indicator: indicator, success: success, failure: failure)
    }
    func connectionWithoutRequestObject(api: String, parameters: Any?, method: HTTPMethod, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        self.connectWithoutRequestObject(api: api, parameters: parameters, method: method, contentType: "application/json", indicator: indicator, success: success, failure: failure)
    }
    func connectionWithRequestObjectFormUrl(api: String, parameters: Any?, method: HTTPMethod, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        self.connectWithRequestObject(api: api, parameters: parameters, method: method, contentType: "application/x-www-form-urlencoded", indicator: indicator, success: success, failure: failure)
    }
    func connectionWithoutRequestObjectFormUrl(api: String, parameters: Any?, method: HTTPMethod, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        self.connectWithoutRequestObject(api: api, parameters: parameters, method: method, contentType: "application/x-www-form-urlencoded", indicator: indicator, success: success, failure: failure)
    }
    func connectionWithMultipart(api: String, keyValueDict: [String: Any]?, keyValueFile: [String: Any]?, method: HTTPMethod, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        self.multipartUpload(api: api, keyValueDict: keyValueDict, keyValueFile: keyValueFile, method: method, contentType: "application/json", indicator: indicator, success: success, failure: failure)
    }
    
}


extension HTTP {
    
    func uploadFile(withThumbNail: URL?, api: String, filePath: URL, type: String, result : @escaping ((_ responseData: [String: AnyObject]?, _ error: Error?) -> ())) {
        
        print(api)
        
        Alamofire.upload(multipartFormData: { (multipartFormData: MultipartFormData) in
            multipartFormData.append(filePath, withName: type)
            if withThumbNail != nil {
                multipartFormData.append(withThumbNail!, withName: "thumbnail")
            }
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold,
           to: api,
           method: HTTPMethod.post,
           headers: nil) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON(completionHandler: { (dataResponse: DataResponse) in
                    do {
                        if let error = dataResponse.error {
                            result(nil, error)
                        }
                        else {
                            if let data = dataResponse.data {
                                if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String: AnyObject] {
                                    result(json, nil)
                                }
                            }
                        }
                    }
                    catch {
                        result(nil, error)
                    }
                })
            case .failure(let encodingError):
                result(nil, encodingError)
            }
        }
    }
}
