//
//  ViewModelCategories.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation


public class ViewModelsCategories:NSObject{
    
    @objc dynamic private(set) var sourceViewModelsCategories:ViewModelDataCategories = ViewModelDataCategories()
    private var token:NSKeyValueObservation?
    private var webService:GetCategories
    var bindToSourceGetCategories :(() -> ()) = {  }
    @objc dynamic private(set) var sourceError:ErrorResponse!
    
    init(webService:GetCategories){
        self.webService = webService
        super.init()
        populateSources()
    }
    
    init(webservice :GetCategories,sourceViewModels :ViewModelDataCategories) {
        
        self.webService = webservice
        super.init()
        
        // call populate sources
        populateSources()
    }
    
    func invalidateObservers() {
        self.token?.invalidate()
    }
    
    
    func populateSources() {
        
        self.webService.loadSources { [unowned self] sources in
            //self.sourceViewModelsLogin = ViewModelLogin.init(source: sources)
            switch sources{
            case .success(let resultJson):
                self.token = self.observe(\.sourceViewModelsCategories) { _,_ in
                    self.bindToSourceGetCategories()
                }
                self.sourceViewModelsCategories = ViewModelDataCategories.init(source: resultJson as! ModeDataCategories)
                break
            case .failure(let failure) :
                self.token = self.observe(\.sourceError) { _,_ in
                    self.bindToSourceGetCategories()
                }
                self.sourceError = errorReport.shareErrorReport.report(value: failure)
                
            default:
                print("")
                
                
            }
        }
    }
    
}

class ViewModelDataCategories:NSObject{
    private var ok:Bool!
    private var data:[ModelData] = []
    
    override init() {
        
    }
    
    init(source:ModeDataCategories){
        self.ok = source.getOk()
        self.data = source.getData()
    }
    func getOk()->Bool{
        return self.ok
    }
    func getData()->[ModelData] {
        return self.data
    }
   
}
