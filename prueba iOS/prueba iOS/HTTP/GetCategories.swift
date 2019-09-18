//
//  GetCategories.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation
class GetCategories:RequestManager{
     // no tiene ningun parametro para hacer la composicion en request manager
    
    public func loadSources(completion:@escaping (ApiResult)->()){
        let url = Urls.shareUrls
        let json:[String:Any] = [:]
        let request = requestManager(body:json , url: url.getUrlBase()+url.getCategories(), httMethod: .GET)
        ResponseService.shareResponseService.response(url:url.getCategories(), request: request,  completion: completion)
        
        
    }
}



