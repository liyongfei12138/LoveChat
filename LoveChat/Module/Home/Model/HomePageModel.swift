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
