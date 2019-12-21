//
//  DetailViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit
import SwiftyStoreKit

class DetailViewController: BaseViewController {
    
    var detail : String = ""
    var index : String = ""
    lazy var navView: DetailNavView = {
        let navView = DetailNavView.init(title:self.detail)
        navView.clickDelegate = self
        return navView
    }()
    
    lazy var listView: DetailTableView = {
        let listView = DetailTableView.init()
        listView.copyDelegate = self
        listView.lockBlock = {
            self.clickLockBtn()
        }
        return listView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pt_hiddenNav(hide: true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.pt_hiddenNav(hide: false, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.navView)
        self.view.addSubview(self.listView)
        
        let isShow = false
        
        if isShow {
            self.listView.configData(dataArr:GetJson.getJsonWith(name: self.index),isShow: isShow)
            configLayou()
        }else{
            let listArr = GetJson.getJsonWith(name: self.index)
            
            self.listView.configData(dataArr:[(listArr.first ?? [:])],isShow: isShow)
            configLayou()
        }
    }
    func clickLockBtn() {
        let alert = UIAlertController.init(title: "解锁更多话术?", message: "点击【确定】解锁更多话术", preferredStyle: UIAlertController.Style.alert)
        let action1 = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default) { (action) in
            //            self.listView.configData(dataArr:GetJson.getJsonWith(name: self.index),isShow: true)
            
            self.getProductId()
            
        }
        let action2 = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel) { (action) in
            
        }
        
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
        
    }
//    func getProductId()  {
//        //获取商品信息
//        SwiftyStoreKit.retrieveProductsInfo(["AllChat"]) { result in
//            if result.retrievedProducts.first != nil {
//
//                self.payWithId()
//            }
//            else if result.invalidProductIDs.first != nil {
//
//                self.payError()
//            }
//            else {
//
//                self.payError()
//            }
//        }
//    }
    
    
    func getProductId() {
        
        //通过product id 购买商品
        SwiftyStoreKit.purchaseProduct("AllChat", quantity: 1, atomically: false) { result in
            switch result {
            case .success(let product):
                //atomically true 表示走服务器获取最后支付结果
                // fetch content from your server, then:
                
                self.paySuccess()
                
                if product.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(product.transaction)
                }
                print("Purchase Success: \(product.productId)")
            case .error(let error):
                self.payError()
            }
        }

        
        
    }
    
    
    func payWithId() {
        
        
        SwiftyStoreKit.retrieveProductsInfo(["AllChat"]) { result in
            if let product = result.retrievedProducts.first {
                SwiftyStoreKit.purchaseProduct(product, quantity: 1, atomically: true) { result in
                    // handle result (same as above)
                    
                    print(result)
                }
            }
        }
    }
    
    
    func paySuccess() {
        
        let alert = UIAlertController.init(title: "", message: "支付成功", preferredStyle: UIAlertController.Style.alert)
        let action1 = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default) { (action) in
        }
        
        alert.addAction(action1)
        self.present(alert, animated: true, completion: nil)
    }
    
    func payError() {
        
        let alert = UIAlertController.init(title: "", message: "支付失败", preferredStyle: UIAlertController.Style.alert)
        let action1 = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default) { (action) in
        }
        
        alert.addAction(action1)
        self.present(alert, animated: true, completion: nil)
        
    }
    func configLayou() {
        self.listView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(self.navView.height)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    /// 显示所有话术
    func unlockAllData() {
        
        self.listView.configData(dataArr:GetJson.getJsonWith(name: self.index),isShow: true)
    }
    
}

extension DetailViewController: ClickNavDelegate,CopyTextDelegate{
    func clickNavWith(type: ClickNavType) {
        if type == .back {
            self.navigationController?.popViewController(animated: true)
        }else{
            let searchVC = SearchViewController()
            searchVC.searchSelectedAction = { [weak self] (title: String?) in
                
                if title != nil {
                    
                    let detailvc = DetailViewController.init(title:title ?? "")
                    self?.navigationController?.pushViewController(detailvc, animated: true)
                }
            }
            
            self.navigationController?.pushViewController(searchVC)
        }
    }
    
    func copyTextWith(manText: String, women: String) {
        let alert = UIAlertController.init(title: "选择复制话术", message: "话术将复制至您的剪贴板", preferredStyle: UIAlertController.Style.alert)
        let action1 = UIAlertAction.init(title: "复制男生", style: UIAlertAction.Style.default) { (action) in
            let pastboard = UIPasteboard.general
            pastboard.string = manText
        }
        let action2 = UIAlertAction.init(title: "复制女生", style: UIAlertAction.Style.cancel) { (action) in
            let pastboard = UIPasteboard.general
            pastboard.string = women
        }
        
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
    }
}
extension DetailViewController{
    convenience init(title:String = "",index:String = "") {
        self.init()
        
        self.title = title
        self.detail = title
        self.index = index
    }
}
