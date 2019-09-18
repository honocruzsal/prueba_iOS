//
//  ResponseService.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation
class ResponseService{
    static let shareResponseService = ResponseService()
    public func response(url:String,request:NSMutableURLRequest,completion :@escaping (ApiResult) -> ()){
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest){data,response,error in
            if error != nil{
                DispatchQueue.main.async {
                    completion(ApiResult.failure(.connectionError))
                }
            }else{
                let httpResponse = response as? HTTPURLResponse
                let codigoRespuesta = httpResponse?.statusCode
                switch Int(codigoRespuesta!){
                case 200:
                    if url == "categories" {
                        
                        if let data = data {
                            let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as Any
                            let dictionariesObject = json as! jsonDictionary
                            
                            let headlines = ModeDataCategories.init(dictionary: dictionariesObject)
                            DispatchQueue.main.async {
                                completion(ApiResult.success(headlines))
                            }
                        }
                        
                    }
                    break
                case 404:
                    DispatchQueue.main.async {
                        completion(ApiResult.failure(.notFound))
                    }
                    break
                case 500:
                    DispatchQueue.main.async {
                        completion(ApiResult.failure(.serverError))
                    }
                    break
                default:
                    DispatchQueue.main.async {
                        completion(ApiResult.failure(.unknownError))
                    }
                    break
                    
                }
            }
        }
        dataTask.resume()
    }
}


