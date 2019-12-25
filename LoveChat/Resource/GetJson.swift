//
//  GetJson.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/20.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

struct GetJson {
    
    static func getJsonWith(name:String) -> [Dictionary<String, Any>]{
        
        let jsonPath: String? = Bundle.main.path(forResource: name, ofType: "json")
        if jsonPath != nil {
            let data: Data? = FileManager.default.contents(atPath: jsonPath!)
            
            if data != nil {
                let object: [String: Any]? = try? data!.jsonObject() as? [String: Any]
                
                if object != nil {
                    let dataDict: [String: Any]? = object!["data"] as? [String: Any]
                    print(dataDict)
                    
                    if dataDict != nil {
                        
                        let list: [Any]? = dataDict?["list"] as? [Any]
                        
                        return list as! [Dictionary<String, Any>]
                    }else{
                        return []
                    }
                    
                }else{
                    return []
                }
                
                
            }else{
                return []
            }
        }
        else{
            return []
        }
        
    }
    
    static func getDetailList(index: String) -> [DetailModel] {
        
        var list: [DetailModel] = [DetailModel]()
        
        let dataArray: [[String: Any]] = getJsonWith(name: index)
        
        for detailDict in dataArray {
            
            let title: String? = detailDict["title"] as? String
            let content: String? = detailDict["content"] as? String
            
            let detailModel: DetailModel = DetailModel.init(title: title ?? "", content: content ?? "", index: index)
            list.append(detailModel)
        }
        
        return list
    }
    
    static func getIndexAllItems() -> [HomeListItem] {
        
        let pageModes: [HomePageModel] = getIndexPageModel()
        var allItems: [HomeListItem] = [HomeListItem]()
        for pageModel in pageModes {
                
            allItems += pageModel.content
        }
    
        return allItems
    }
    
    static func getIndexPageModel() -> [HomePageModel] {
        
        var pageModels: [HomePageModel]?
        
        let jsonPath: String? = Bundle.main.path(forResource: "index", ofType: "json")
        if jsonPath != nil {
            let data: Data? = FileManager.default.contents(atPath: jsonPath!)
            
            if data != nil {
                let object: [String: Any]? = try? data!.jsonObject() as? [String: Any]
                
                if object != nil {
                    let dataDict: [String: Any]? = object!["data"] as? [String: Any]
                    
                    if dataDict != nil {
                        
                        let list: [Any]? = dataDict?["list"] as? [Any]
                        pageModels = [HomePageModel].deserialize(from: list) as? [HomePageModel]
                    }
                }
            }
        }
        
        return pageModels ?? [HomePageModel]()
    }
    
}
