//
//  RequestManager.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation
internal class RequestManager{
    public func requestManager(body:jsonDictionary,url:String,httMethod:TypeMethod)->NSMutableURLRequest{
        var request:NSMutableURLRequest = NSMutableURLRequest()
        request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = httMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
        
    }
}

enum TypeMethod:String{
    case GET
    case POST
    case PUT
    
}
