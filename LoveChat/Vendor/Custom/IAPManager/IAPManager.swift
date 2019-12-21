
//
//  IAPManager.swift
//  LoveChat
//
//  Created by walker on 2019/12/21.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import Foundation
import SwiftyStoreKit

struct IAPManager {
    
    private let ISPAY_SAVE_KEY = "com.loveChat.isPay"
    
    // MARK: 单例
    static let stand = IAPManager()
    private init(){}
    
    
    func payProductId(success: @escaping(()->()), fail: @escaping(()->())) {
        
        //通过product id 购买商品
        SwiftyStoreKit.purchaseProduct("AllChat", quantity: 1, atomically: false) { result in
            switch result {
            case .success(let product):
                
                if product.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
                
                self.paySuccess()
                
                success()
                
                print("Purchase Success: \(product.productId)")
                
            case .error(let error):
                self.payError()
                
                fail()
            }
        }
    }
    
    func restorePurchases(success: @escaping(()->()), fail: @escaping(()->())) {
        
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoreFailedPurchases.count > 0 {
                print("Restore Failed: \(results.restoreFailedPurchases)")
                
                fail()
            }
            else if results.restoredPurchases.count > 0 {
                print("Restore Success: \(results.restoredPurchases)")
                self.paySuccess()
                success()
            }
            else {
                fail()
                print("Nothing to Restore")
            }
        }
        
    }
    
    
    
    func payError() {
        print("pay failed ")
        
    }
    
    /// 是否购买过
    public func isPay() -> Bool {
        
        return UserDefaults.standard.bool(forKey: ISPAY_SAVE_KEY)
    }
    
    /// 购买成功
    public func paySuccess() {
        
        UserDefaults.standard.set(true, forKey: ISPAY_SAVE_KEY)
    }
    
    /// 移除购买状态
    public func removePayState() {
        
        UserDefaults.standard.set(false, forKey: ISPAY_SAVE_KEY)
    }
}
