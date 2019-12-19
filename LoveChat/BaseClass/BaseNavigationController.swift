//
//  BaseNavigationController.swift
//  GeneralProject
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit

open class BaseNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    /// 导航栏背景颜色
    open var navBarBackGroundColor: UIColor? {
        
        didSet{
            
            if self.navBarBackGroundColor != nil {
                
                self.navigationBar.setBackgroundImage(UIImage.gl_image(color: self.navBarBackGroundColor!, size: CGSize.init(width: 88, height: UIScreen.main.bounds.size.width)), for: UIBarMetrics.default)
            }
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        gl_customInitialize()
        // 设置导航栏颜色
        self.navBarBackGroundColor = .white
    }
    
    /// 重写push方法，跳转二级界面时自动隐藏tabbar
    ///
    /// - Parameters:
    ///   - viewController: 将要push的控制器
    ///   - animated: 是否有动画
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count >= 1{
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    /// 自定义初始化
    open func gl_customInitialize() {
        self.view.backgroundColor = .white
        
        if self.navBarBackGroundColor != nil  {
            self.navigationBar.setBackgroundImage(UIImage.gl_image(color: self.navBarBackGroundColor!, size: CGSize.init(width: 88, height: UIScreen.main.bounds.size.width)), for: UIBarMetrics.default)
        }
        
    }
}

// MARK: - UIImage Extension
public extension UIImage {
    
    /// SwifterSwift: Create UIImage from color and size.
    ///
    /// - Parameters:
    ///   - color: image fill color.
    ///   - size: image size.
    class func gl_image(color: UIColor, size: CGSize) -> UIImage! {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        
        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            
            return UIImage.init()
        }
        return UIImage.init(cgImage: aCgImage)
    }
}
