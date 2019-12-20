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
                        print(list)
                        
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
}
