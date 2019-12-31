//
//  HomePageModel.swift
//  LoveChat
//
//  Created by walker on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import Foundation
import HandyJSON


struct HomePageModel: HandyJSON  {

    var title: String = ""
    var color: String = ""
    var content: [HomeListItem] = [HomeListItem]()
}

struct HomeListItem: HandyJSON {
    
    var title: String = ""
    var index: String = ""
    
}

struct HomeBannarModel {
    
    static func getBannarData() ->[Dictionary<String,Any>] {
        
        let info1 = ["icon":"home_1","title":"开场白"]
        let info2 = ["icon":"home_2","title":"幽默聊天"]
        let info3 = ["icon":"home_3","title":"搭讪话术"]
        let info4 = ["icon":"home_4","title":"情感共鸣"]
        let info5 = ["icon":"home_5","title":"隐性诱惑"]
        let info6 = ["icon":"home_6","title":"更多"]
        
        
        return [info1,info2,info3,info4,info5,info6]
    }
}
