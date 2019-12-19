
//
//  BaseViewController.swift
//  GeneralProject
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    
    /// 自定义返回按钮
    lazy var customBackBtn: UIBarButtonItem = {
        let backBtn = UIBarButtonItem.init()
        backBtn.title = ""
        return backBtn
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ColorWhite

        gl_customInitialize()
    }
    
    /// 标题的属性设置
    open var titleTextAttributes: [NSAttributedString.Key: Any]? = [:] {
        
        didSet{
            
            if self.titleTextAttributes != nil {
                self.navigationController?.navigationBar.titleTextAttributes = self.titleTextAttributes
            }
        }
    }
    
    /// 自定义初始化
    open func gl_customInitialize() {
        self.view.backgroundColor = ColorWhite
        self.navigationItem.backBarButtonItem = self.customBackBtn
        self.navigationController?.navigationBar.tintColor = .black
        // 配置标题颜色
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        if self.titleTextAttributes != nil {
            self.navigationController?.navigationBar.titleTextAttributes = self.titleTextAttributes
        }
    }
}

// 导航栏隐藏
extension BaseViewController {
 
    
    /// 隐藏导航栏
    /// - Parameter hide: 是否隐藏
    /// - Parameter animated: 是否有动画
    func pt_hiddenNav(hide: Bool, animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(hide, animated: animated)
    }
}
