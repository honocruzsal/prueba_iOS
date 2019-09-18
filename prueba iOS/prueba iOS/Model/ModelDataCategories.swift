//
//  ModelDataCategories.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation

struct ModeDataCategories {

    private var ok:Bool!
    private var data:[ModelData] = []
    init(dictionary:jsonDictionary) {
        dictionary["ok"] != nil ? (self.ok = dictionary["ok"] as? Bool):(self.ok = false)
        dictionary["data"] != nil ? () = llenarData(dictionary: dictionary):(self.ok = false)
    }
    
    mutating func llenarData(dictionary:jsonDictionary){
        let arrayData = dictionary["data"] as? [jsonDictionary]
        for item in arrayData!{
            self.data.append(ModelData.init(dictionary: item as jsonDictionary))
        }
    }
    
    func getOk()->Bool{
        return ok
    }
    func getData()->[ModelData]{
        return data
    }
}
