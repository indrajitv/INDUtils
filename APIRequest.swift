//
//  File.swift
//  APIRequest
//
//  Created by Indajit on 26/04/18.
//  Copyright © 2018 Indajit. All rights reserved.
//

import UIKit

enum MethodName:String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

class APIRequest:NSObject{
   
  func doRequestForJson(urlString:String,method:MethodName,parameters:Mappable?,showLoading:Bool = true,completionHandler:@escaping (Any?,Error?)->()){
        
        getDataFromServer(urlString: urlString,method: method, parameters: parameters) { (data, error) in
            if let errorFound = error{
                completionHandler(nil, errorFound)
            }else if let dataFound = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: dataFound, options: .mutableContainers)
                    completionHandler(json, nil)
                }catch let err{
                    completionHandler(nil,err)
                }
            }else{
                completionHandler(nil,nil)
            }
        }
    }
    
    func doRequestForDecodable<T:Mappable>(urlString:String,mapable:T.Type,method:MethodName,parameters:Mappable?,showLoading:Bool = true,completionHandler:@escaping (T?,ServerErrorModel?,Error?)->()){
       
        
        getDataFromServer(urlString: urlString, method: method, parameters: parameters) { (data, error) in
            if let errorFound = error{
                completionHandler(nil, nil,errorFound)
            }else if let dataFound = data,var stringFromData = String(data: dataFound, encoding: .utf8){
                
                //To be removed once API sorts the issue
                if let json = try? JSONSerialization.jsonObject(with: dataFound, options: .mutableContainers) as? [[String:Any]]{
                    let arrayToJson = ["data":json]
                    if let dataOfarrayToJsonObject = try? JSONSerialization.data(withJSONObject: arrayToJson, options: .prettyPrinted),let stringConveted = String(data: dataOfarrayToJsonObject, encoding: .utf8){
                        stringFromData = stringConveted
                    }
                }
                //To be removed once API sorts the issue
                
                if let serverErrorModel = ServerErrorModel.init(JSONString: stringFromData){
                        completionHandler(nil,serverErrorModel,nil)
                }else{
                    let mappableObject = mapable.init(JSONString: stringFromData)
                    completionHandler(mappableObject,nil,nil)
                }
            }
        }
        
    }
    
    func someThingWrong(msg:String = "Something went wrong"){
        print("Someting went wrong")
    }
    
    
   fileprivate func getDataFromServer(urlString:String,method:MethodName,parameters:Mappable?,completionHandler:@escaping (Data?,Error?)->()){
    
     if let url = URL(string: urlString){
            
            var request = URLRequest(url: url,timeoutInterval: 60)
            
            // Unique Device Identifier
            if let uuidString = UIDevice.current.identifierForVendor?.uuidString,let deviceToken = Preferences.getObjectFor(type: .deviceToke) as? String{
                request.addValue(uuidString, forHTTPHeaderField: deviceToken)
            }
        
            request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = method.rawValue
            if let jsonString = parameters?.toJSONString(){
                request.httpBody = jsonString.data(using: .utf8)
            }
            
            // Show Network Indicator
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            let configutation = URLSessionConfiguration.default
            let urlSession = URLSession.init(configuration: configutation, delegate: self, delegateQueue: nil)
            urlSession.dataTask(with: request, completionHandler: { (data, response, error) in
            
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                })
                DispatchQueue.main.async(execute: {
                    if let errorFound = error{
                        completionHandler(nil, errorFound)
                    }else if let dataFound = data{
                        print("Response - ",String(data: dataFound, encoding: .utf8) ?? "")
                        completionHandler(dataFound,nil)
                    }else{
                        completionHandler(nil, nil)
                    }
                })
            }).resume()
        }
    }
    
    
}


extension APIRequest:URLSessionDelegate{
    
}














