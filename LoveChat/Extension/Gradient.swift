
//
//  Gradient.swift
//  BabyCircle
//
//  Created by Mac on 2019/12/10.
//  Copyright © 2019 BBC. All rights reserved.
//

import UIKit
import Pastel

/// 渐变的点
enum GradientPoint: Int {
    case left
    case top
    case right
    case bottom
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    
    var point: CGPoint {
        switch self {
        case .left: return CGPoint(x: 0.0, y: 0.5)
        case .top: return CGPoint(x: 0.5, y: 0.0)
        case .right: return CGPoint(x: 1.0, y: 0.5)
        case .bottom: return CGPoint(x: 0.5, y: 1.0)
        case .topLeft: return CGPoint(x: 0.0, y: 0.0)
        case .topRight: return CGPoint(x: 1.0, y: 0.0)
        case .bottomLeft: return CGPoint(x: 0.0, y: 1.0)
        case .bottomRight: return CGPoint(x: 1.0, y: 1.0)
        }
    }
    
    var pastelPoint: PastelPoint {
        switch self {
        case .left: return PastelPoint.left
        case .top: return PastelPoint.top
        case .right: return PastelPoint.right
        case .bottom: return PastelPoint.bottom
        case .topLeft: return PastelPoint.topLeft
        case .topRight: return PastelPoint.topRight
        case .bottomLeft: return PastelPoint.bottomLeft
        case .bottomRight: return PastelPoint.bottomRight
        }
    }
}

//MARK: 视图渐变
extension UIView {
    
    /// 添加渐变
    /// - Parameter startPoint: 渐变开始的点
    /// - Parameter endPoint: 渐变结束的点
    /// - Parameter colors: 颜色数组
    func gl_addGradient(startPoint: GradientPoint = .left, endPoint: GradientPoint = .right, colors:[UIColor] = [UIColor.init(hex: 0xFCD6F0)!,UIColor.init(hex: 0xF8ACDD)!]) {
        
        self.gl_removeGradient()
        
        let pastelView = PastelView(frame: self.bounds)
        pastelView.startPastelPoint = startPoint.pastelPoint
        pastelView.endPastelPoint = endPoint.pastelPoint
        pastelView.animationDuration = TimeInterval(CGFloat.greatestFiniteMagnitude)
        pastelView.setColors(colors)
        pastelView.startAnimation()
        pastelView.isUserInteractionEnabled = false
        self.insertSubview(pastelView, at: 0)
        
        pastelView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    
    /// 添加渐变
    /// - Parameter startPoint: 渐变开始的点
    /// - Parameter endPoint: 渐变结束的点
    /// - Parameter colors: 颜色数组
    convenience init(gradient startPoint: GradientPoint = .topLeft, endPoint: GradientPoint = .bottomRight, colors:[UIColor]) {
        
        self.init()
        
        let pastelView = PastelView(frame: self.bounds)
        pastelView.startPastelPoint = startPoint.pastelPoint
        pastelView.endPastelPoint = endPoint.pastelPoint
        pastelView.animationDuration = TimeInterval(CGFloat.greatestFiniteMagnitude)
        pastelView.setColors(colors)
        pastelView.startAnimation()
        pastelView.isUserInteractionEnabled = false
        self.insertSubview(pastelView, at: 0)
        
        pastelView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    
    /// 移除渐变
    func gl_removeGradient() {
        
        for view in self.subviews {
            
            if view.isMember(of: PastelView.self) {
                
                view.removeFromSuperview()
            }
        }
    }
    
}

