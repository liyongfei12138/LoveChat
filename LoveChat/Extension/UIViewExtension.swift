//
//  UIViewExtension.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/11/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class UIViewExtension: UIView {



}
extension UIView{
    func configShadow(bColor:UIColor,
                      sColor:UIColor,offset:CGSize,opacity:Float,radius:CGFloat,shadowRadius:CGFloat) {

        //设置边框颜色
        self.layer.borderColor = bColor.cgColor
        //设置边框圆角
        self.layer.cornerRadius = radius
        //设置阴影颜色
        self.layer.shadowColor = sColor.cgColor
        //设置透明度
        self.layer.shadowOpacity = opacity
        //设置阴影半径
        self.layer.shadowRadius = shadowRadius
        //设置阴影偏移量
        self.layer.shadowOffset = offset
        
    }
    
    /// 添加毛玻璃效果
    /// - Parameter style: 样式
    func addVisualEffectView(style: UIBlurEffect.Style = .light) {
        
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView.init(effect: blurEffect)
        self.addSubview(blurEffectView)
        
        blurEffectView.snp.makeConstraints { (make) in
            
            make.edges.equalTo(self)
        }
    }


}
