//
//  YFHomeMoreViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/27.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class YFHomeMoreViewController: BaseViewController {

    lazy var listView: HomeListView = {
        let listView = HomeListView.init()
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "更多话术"
//        self.listView.updateList(models: )
        self.view.addSubview(self.listView)
    }
    
    func configLayout(){
        self.listView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }



}
