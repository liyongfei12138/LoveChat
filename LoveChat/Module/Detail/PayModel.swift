//
//  PayModel.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/21.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit
import SwiftyStoreKit
class PayModel: NSObject {

    /// 购买商品
        class func purchase(productID: String,
                            inPurchaseClosure:@escaping ((_ inPurchaseResult: InPurchaseResult)->())) {
            SwiftyStoreKit.purchaseProduct(productID, quantity: 1, atomically: true) { (result) in
                switch result {
                case .success(let purchase):
                    print("Purchase Success: \(purchase.productId)")
                    // 正式验证
                    self.verifyReceipt(service: .production)
                    inPurchaseClosure(LFPayTool.InPurchaseResult.success)
                case .error(let error):
                    inPurchaseClosure(LFPayTool.InPurchaseResult.failure)
                    switch error.code {
                    case .unknown:
                        print("Unknown error. Please contact support")
                    case .clientInvalid:
                        print("Not allowed to make the payment")
                    case .paymentCancelled:
                        break
                    case .paymentInvalid:
                        print("The purchase identifier was invalid")
                    case .paymentNotAllowed:
                        print("The device is not allowed to make the payment")
                    case .storeProductNotAvailable:
                        print("The product is not available in the current storefront")
                    case .cloudServicePermissionDenied:
                        print("Access to cloud service information is not allowed")
                    case .cloudServiceNetworkConnectionFailed:
                        print("Could not connect to the network")
                    case .cloudServiceRevoked:
                        print("User has revoked permission to use this cloud service")
                    default:
                        print((error as NSError).localizedDescription)
                    }
                }
            }
        }

}
