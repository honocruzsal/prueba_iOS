//
//  ModelData.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation

struct ModelData {
    private var id:Int!
    private var category:String!
    private var color:String!
    private var status:Int!
    private var modelsMovies:[ModelMovies] = []
    
    init(dictionary:jsonDictionary){
        dictionary["id"] != nil ? (self.id = dictionary["id"] as? Int):(self.id = 0)
        dictionary["category"] != nil ? (self.category = dictionary["category"] as? String):(self.category = "")
        dictionary["color"] != nil ? (self.color = dictionary["color"] as? String):(self.color = "")
        dictionary["status"] != nil ? (self.status = dictionary["status"] as? Int):(self.status = 0)
        dictionary["movies"] != nil ? (llenarMovies(dictionary: dictionary)):(self.id = 0)
    }
    
    mutating func llenarMovies(dictionary:jsonDictionary){
        let arrayMovies = dictionary["movies"] as? [jsonDictionary]
        for item in arrayMovies!{
            self.modelsMovies.append(ModelMovies.init(dictionary: item as jsonDictionary))
        }
    }
    
    func getId()->Int{
        return self.id
    }
    func getCategory()->String{
        return self.category
    }
    func getColor()->String{
        return self.color
    }
    func getStatus()->Int{
        return self.status
    }
    func getModelsMovies()->[ModelMovies]{
        return modelsMovies
    }
}
