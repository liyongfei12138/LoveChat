//
//  Constants.swift
//  GeneralProject
//
//  Created by Ghostlord on 2019/6/12.
//  Copyright © 2019 ghostlord. All rights reserved.
//

//MARK: 开发常用常量

import UIKit

// ----------- 公共尺寸 ------
/* 屏幕宽 */
public let SCREEN_WIDTH: CGFloat =  CGFloat(UIScreen.main.bounds.width)
/* 屏幕高 */
public let SCREEN_HEIGHT: CGFloat =  CGFloat(UIScreen.main.bounds.height)
/* 较短的宽度为(竖屏为宽，横屏为高) */
public let SCREEN_SHORT: CGFloat = (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_WIDTH : SCREEN_HEIGHT)

// --------- 适配公共宏 ------
/** 是否是异形屏 */
public let IS_HETERO_SCREEN:Bool =  (GL_iPhone_X || GL_iPhone_X_Max)

/** 是否是竖屏 */
public let IS_PORTRAIT:Bool =  (UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portrait || UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portraitUpsideDown)

// -- 导航栏和Tabbar针对异形屏的适配  --
public let Nav_topH: CGFloat    =   (IS_HETERO_SCREEN ? 88.0 : 64.0)    // 导航栏+状态栏高度
public let Tab_H: CGFloat       =   (IS_HETERO_SCREEN ? 83.0 : 49.0)    // 标签栏高度
public let NavMustAdd: CGFloat  =   (IS_HETERO_SCREEN ? 34.0 : 0.0)     // 异形屏上方安全高度
public let TabMustAdd: CGFloat  =   (IS_HETERO_SCREEN ? 20.0 : 0.0)     // 异形屏下方安全高度
public let Status_H: CGFloat    =   (IS_HETERO_SCREEN ? 44.0 : 20.0)    // 状态栏高度
public let NavItem_H: CGFloat   =   (44.0)   // 导航栏
public let TabBarHeight: CGFloat = (IS_HETERO_SCREEN ? (49.0 + 34.0) : 49.0) //tabbar高度

// 手机尺寸型号
public let GL_iPhone_4x: Bool      =   (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 480)
public let GL_iPhone_5x: Bool      =   (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 568)
public let GL_iPhone_6x: Bool      =   (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 667)
public let GL_iPhone_plus: Bool    =   (SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 736)
public let GL_iPhone_X: Bool       =   (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 812)   // iPhone X,    iPhone XS
public let GL_iPhone_X_Max: Bool   =   (SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 896)   // iPhone XR,   iPhone XS Max

// 颜色相关
public let ColorTheme: UIColor          =   #colorLiteral(red: 1, green: 0.6470588235, blue: 0, alpha: 1) // 主题颜色
public let ColorTabBar: UIColor         =   #colorLiteral(red: 0.1215686275, green: 0.1215686275, blue: 0.1215686275, alpha: 1)   // 0x393B42 控制器背景色
public let ColorBlack: UIColor          =   #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)   // 0x000000 tabbar背景颜色
public let ColorAlertBG: UIColor        =   #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4)   // 0x000000 alpha: 0.4 弹框背景色
public let ColorBlack_19: UIColor       =   #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1)   // 0x191919 浅黑
public let ColorLightPink: UIColor      =   #colorLiteral(red: 0.937254902, green: 0.7529411765, blue: 0.8156862745, alpha: 1)   // 0xEFC0D0 浅粉
public let ColorPink: UIColor           =   #colorLiteral(red: 0.9490196078, green: 0.6156862745, blue: 0.768627451, alpha: 1)   // 0xF29DC4 灰色
public let ColorGrey: UIColor           =   #colorLiteral(red: 0.5098039216, green: 0.4431372549, blue: 0.4588235294, alpha: 1)   // 0x827175 深灰
public let ColorLightGray: UIColor      =   #colorLiteral(red: 0.6117647059, green: 0.6156862745, blue: 0.6274509804, alpha: 1)   // 0x9C9DA0 浅灰
public let ColorLightRed: UIColor       =   #colorLiteral(red: 1, green: 0.3725490196, blue: 0.3921568627, alpha: 1)   // 0xFF5F64 浅红
public let ColorWhite:UIColor           =   #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)   // 0xffffff 白色
public let ColorGreen:UIColor           =   #colorLiteral(red: 0.01568627451, green: 0.8, blue: 0.1803921569, alpha: 1)   // 0x04CC2E 绿色
public let ColorDeepGray:UIColor        =   #colorLiteral(red: 0.3882352941, green: 0.4, blue: 0.431372549, alpha: 1)   // 0x63666E 深灰
public let ColorInputBG: UIColor        =   #colorLiteral(red: 0.1529411765, green: 0.1607843137, blue: 0.1843137255, alpha: 1)   // 0x27292f 浅黑
public let ColorLineBG: UIColor         =   #colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9764705882, alpha: 1)   // 0xf2f4f9 阴影分割线颜色
public let ColorTableViewBG: UIColor    =   #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)   // F5F5F5 tableViewb背景颜色


public let TextColorLevel1 = UIColor.gl_hex(hex: 0x222222)
public let TextColorLevel2 = UIColor.gl_hex(hex: 0x666666)
public let TextColorLevel3 = UIColor.gl_hex(hex: 0x999999)

// 字体样式
public let FontNameDIN = "DIN Alternate"      // DIN Alternate
public let FontNamePF_Regular = "PingFangSC-Regular"      // 苹方-常规体
public let FontNamePF_Semibold = "PingFangSC-Semibold"      // 苹方-中粗体

/// 按比例适配宽度
/// - Parameter width: 6尺寸上的宽度
public func SCALEWIDTH(width: CGFloat) -> CGFloat {
    
    return SCREEN_WIDTH / 375.0 * width 
}

