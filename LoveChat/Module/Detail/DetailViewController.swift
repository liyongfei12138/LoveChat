//
//  DetailViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    var detail : String = ""
    
    lazy var navView: DetailNavView = {
        let navView = DetailNavView.init(title:self.detail)
        navView.clickDelegate = self
        return navView
    }()
    
    lazy var listView: DetailTableView = {
        let listView = DetailTableView.init()
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
        
        
        self.listView.configData(dataArr:GetJson.getJsonWith(name: self.detail))
        configLayou()
            
    }
    func configLayou() {
        self.listView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(self.navView.height)
            make.left.right.bottom.equalToSuperview()
        }
        
    }


}

extension DetailViewController: ClickNavDelegate{
    func clickNavWith(type: ClickNavType) {
        if type == .back {
            self.navigationController?.popViewController(animated: true)
        }else{
            let searchVC = SearchViewController()
            self.navigationController?.pushViewController(searchVC)
            
        }
    }
}
extension DetailViewController{
    convenience init(title:String = "") {
        self.init()
        
        self.title = title
        self.detail = title
    }
}
