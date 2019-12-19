//
//  BaseView.swift
//  GeneralProject
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit

open class BaseTabBarController: UITabBarController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        gl_customInitialize()
    }
    
    /// 自定义初始化
    open func gl_customInitialize() {
        self.view.backgroundColor = UIColor.white
        
    }

}
