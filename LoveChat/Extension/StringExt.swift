//
//  StringExt.swift
//  BabyCircle
//
//  Created by Mac on 2019/12/9.
//  Copyright © 2019 BBC. All rights reserved.
//

import UIKit

// MARK: - 字符串常用扩展
extension String {
    
    /// 是否是空字符串
    ///
    /// - Parameter string: 需要检测的字符串
    /// - Returns: 空返回true
    public static func gl_empty(string: Any?) -> Bool {
        
        var empty = true
        
        if string != nil {
            
            if let stringValue = string as? String {
                
                let newStringVaule = self.gl_removeHeadAndTailSpaceAndNewlines(string: stringValue)
                
                if newStringVaule.count > 0 {
                    empty = false
                }
                
            }else if let nstringValue = string as? NSString {
                
                let newStringVaule = self.gl_removeHeadAndTailSpaceAndNewlines(nsstring: nstringValue)
                
                if newStringVaule.length > 0 {
                    empty = false
                }
            }
        }
        
        return empty
    }
    
    /// 去掉首尾空格和换行符(String)
    ///
    /// - Parameter string: 需要操作的字符串
    /// - Returns: 去掉后的字符串
    public static func gl_removeHeadAndTailSpaceAndNewlines(string: String!) -> String {
        
        let whiteSpaceAndNewlines = CharacterSet.whitespacesAndNewlines
        
        return string.trimmingCharacters(in: whiteSpaceAndNewlines)
    }
    
    /// 去掉首尾空格和换行符(NSString)
    ///
    /// - Parameter nsstring: 需要操作的字符串
    /// - Returns: 去掉后的字符串
    public static func gl_removeHeadAndTailSpaceAndNewlines(nsstring: NSString!) -> NSString {
        
        let whiteSpaceAndNewlines = NSCharacterSet.whitespacesAndNewlines
        
        return nsstring.trimmingCharacters(in: whiteSpaceAndNewlines) as NSString
    }
    
    
    /// 计算字体所占区域高度
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - width: 宽度限制
    /// - Returns: 占据的高度
    public func gl_heightForString(font: UIFont, width: CGFloat) -> CGFloat {
        
        let nsstr: NSString = NSString.init(string: self)
        
        let rect = nsstr.boundingRect(with: CGSize.init(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.size.height)
    }
    
}

//MARK: 时间转换
extension String {
    
    
    /// 时间戳转换成字符串
    /// - Parameter sec: 秒
    /// - Parameter formatter: 格式(默认为yyyy-MM-dd HH:mm:ss)
    static func gl_convertTimeStamp(sec: String?, formatter: String? = "yyyy-MM-dd HH:mm:ss") -> String {
        
        var time: String = ""
        
        var timeInterval = Int(sec ?? "0")
        
        if timeInterval == nil {
            timeInterval = 0
        }
        
        let date = Date.init(timeIntervalSince1970: Double(timeInterval!))
        let dateFormatter = DateFormatter.init()
        dateFormatter.locale = Locale.current
        
        
        if formatter != nil && formatter!.count > 0 {
            dateFormatter.dateFormat = formatter
        }
        
        time = dateFormatter.string(from: date)
        
        return time
    }
    
    
    /// 时间戳转换成字符串
    /// - Parameter msec: ⚠️毫秒
    /// - Parameter formatter: 格式(默认为yyyy-MM-dd HH:mm:ss)
    static func gl_convertTimeStamp(msec: String?, formatter: String? = "yyyy-MM-dd HH:mm:ss") -> String {
        
        var time: String = ""
        
        var timeInterval = Int(msec ?? "0")
        
        if timeInterval == nil {
            timeInterval = 0
        }
        
        let date = Date.init(timeIntervalSince1970: Double(timeInterval! / 1000))
        let dateFormatter = DateFormatter.init()
        
        if formatter != nil && formatter!.count > 0 {
            
            dateFormatter.dateFormat = formatter
        }
        
        time = dateFormatter.string(from: date)
        
        return time
    }
    
    /// 转换为当前语言显示的时间格式
    /// - Parameter timeString: 时间字符串
    /// - Parameter formatter: 原先样式
    static func gl_convertLanguageTime(timeString: String, formatter: String) -> String {
        
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = formatter
        dateFormatter.timeZone = TimeZone.init(secondsFromGMT: 8)
        
        if let date = dateFormatter.date(from: timeString) {
            
            let newFormatter = "yyyy-MM-dd"
            let newDateFormatter = DateFormatter.init()
            newDateFormatter.dateFormat = newFormatter
            
            return newDateFormatter.string(from: date)
        
        }
        return ""
    }
    
    /// 秒数格式化时分秒
    /// - Parameter second: second description
    static func gl_timeFormatted(second: Int) -> String {
        
        let hour: Int = Int(second/3600)
        let minute: Int = Int(second/60)
        let second: Int = second % 60

        return String(format: "%02d:%02d:%02d", hour, minute, second)
    }
}

//MARK: 计算
extension String {
    
    /// 获得文字占据的区域大小
    /// - Parameter font: 字体大小
    /// - Parameter maxSize: 最大区域
    func gl_textRect(font: UIFont, maxSize: CGSize) -> CGRect {
        
        let nsString: NSString = self as NSString
        
        let attributes: [NSAttributedString.Key:Any] = [NSAttributedString.Key.font: font]
        
        let rect = nsString.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return rect
    }
    
    /// 获得文字占据的区域大小，返回size
    func suggestedSize(font:UIFont)  -> CGSize{
        let str = self as NSString
        return str.size(withAttributes: [NSAttributedString.Key.font:font])
    }
    /// 根据长度返回size
    func suggestedSize(font : UIFont, width : CGFloat) -> CGSize {
        let str = self as NSString
        let tempSize = str.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                        options: .usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font:font],
                                        context: nil);
        return tempSize.size
    }
}

//MARK: 字符串截取
extension String {
    
    //1, 截取规定下标之后的字符串
    func subStringFrom(index: Int)-> String {
        
        let temporaryString: String = self
        
        let temporaryIndex = temporaryString.index(temporaryString.startIndex, offsetBy: index)
        
        return String(temporaryString[temporaryIndex...])
    }
    
    //2, 截取规定下标之前的字符串
    func subStringTo(index: Int) -> String {
        
        let temporaryString = self
        let temporaryIndex = temporaryString.index(temporaryString.startIndex, offsetBy: index)
        return String(temporaryString[...temporaryIndex])
    }
}

//转nsrange
extension String {
    func nsrange(fromRange range : Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
}

//MARK: 编码
extension String {
    
    func utf8Encoded() -> Data {
        
        let data = self.data(using: String.Encoding.utf8)
        return data ?? Data.init()
    }
}
