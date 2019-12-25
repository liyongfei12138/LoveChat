//
//  DetailModel.swift
//  LoveChat
//
//  Created by walker on 2019/12/25.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import Foundation

class DetailModel: NSObject {

    @objc var title: String = ""
    @objc var content: String = ""
    @objc var index: String = ""
    
    init(title: String, content: String, index: String) {
        self.title = title
        self.content = content
        self.index = index
    }
}

//extension DetailModel {
//    mutating func updateIndex(index: String) {
//        
//        self.index = index
//    }
//}
