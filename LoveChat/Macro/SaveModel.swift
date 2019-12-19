//
//  SaveModel.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

struct SaveModel {

    public let SAVE_HEAD_IMG = "SAVE_HEAD_IMG_KEY"
    
    static func saveHeadImg(image:UIImage) {
       
        let data : Data = image.pngData()!

//
        UserDefaults.standard.set(object: data, forKey: SaveModel().SAVE_HEAD_IMG)
    }
    
    static func getHeadImg() ->UIImage{
        
        let data = UserDefaults.standard.object(forKey: SaveModel().SAVE_HEAD_IMG)
        
        if data != nil {
            let myImage = UIImage.init(data: data as! Data)
            
            return myImage ?? UIImage(named: "icon")!
        }else{
            return UIImage(named: "icon")!
        }
        
        
    }
}
