//
//  ModelMovies.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation
typealias jsonDictionary = [String:Any]
struct ModelMovies {
    
    private var id:Int!
    private var title:String!
    private var subtitle:String!
    private var year:Int!
    private var description:String!
    private var status:Int!
    private var idCategory:Int!
    
    init(dictionary:jsonDictionary) {
        dictionary["id"] != nil ? (self.id = dictionary["id"] as? Int):(self.id = 0)
        dictionary["title"] != nil ? (self.title = dictionary["title"] as? String):(self.title = "")
        dictionary["subtitle"] != nil ? (self.subtitle = dictionary["subtitle"] as? String):(self.subtitle = "")
        dictionary["year"] != nil ? (self.year = dictionary["year"] as? Int):(self.year = 0)
        dictionary["description"] != nil ? (self.description = dictionary["description"] as? String):(self.description = "")
        dictionary["status"] != nil ? (self.status = dictionary["status"] as? Int):(self.status = 0)
        dictionary["idCategory"] != nil ? (self.idCategory = dictionary["idCategory"] as? Int):(self.idCategory = 0)
    }
    
    func getId()->Int{
        return id
    }
    
    func getTitle()->String{
        return title
    }
}
