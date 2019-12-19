//
//  SaveModel.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

struct SaveModel {

//    public let SAVE_HEAD_IMG = "SAVE_HEAD_IMG_KEY"
    public let HEAD_IMG_PATH: String = NSHomeDirectory() + "/Documents/headImg"
    static func saveHeadImg(image:UIImage) {
       
        let data : Data = image.jpegData(compressionQuality: 0.6)!

//
//        UserDefaults.standard.set(object: data, forKey: SaveModel().SAVE_HEAD_IMG)
        
        
        try? data.write(to: URL.init(fileURLWithPath: SaveModel().HEAD_IMG_PATH))
    }
    
    static func getHeadImg() ->UIImage{
        
//        let data: Data? = UserDefaults.standard.object(forKey: SaveModel().SAVE_HEAD_IMG) as? Data
        let data: Data? = try? Data.init(contentsOf: URL.init(fileURLWithPath: SaveModel().HEAD_IMG_PATH))
        if data != nil {
            let myImage = UIImage.init(data: data!)
            
            return myImage ?? UIImage(named: "icon")!
        }else{
            return UIImage(named: "icon")!
        }
        
        
    }
}
