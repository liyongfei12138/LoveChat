//
//  BaseView.swift
//  GeneralProject
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit

open class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        gl_customInitialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 自定义初始化
    open func gl_customInitialize() {
        self.backgroundColor = .white
        
    }
    
    /// 刷新数据
    open func reloadViewData(){}
}
