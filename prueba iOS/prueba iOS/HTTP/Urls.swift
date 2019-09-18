//
//  Urls.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation
public class Urls{
    private var urlBase:String = "http://garagecoders.rocks:4000/api/movies/"
    private var categories:String = "categories"
    public static let shareUrls = Urls()
    
    public func getUrlBase()->String{
        return self.urlBase
    }
    public func getCategories()->String{
        return self.categories
    }
    
}
