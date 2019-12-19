//
//  ClassName.swift
//  Pretty
//
//  Created by Ghostlord on 2019/8/28.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import Foundation

// MARK: - 获得类名字符串，有可能返回空字符串
extension String {
    
    static func gl_fromClass(Class: AnyClass) -> String! {
        
        var className: String = String()
        let typeString: String = "\(type(of: Class))"
        
        if typeString.contains(".") {
            
            let typeArray: [String] = typeString.components(separatedBy: ".")
            className = typeArray[0]
        }else {
            
            className = typeString
        }
        
        return className
    }
}
