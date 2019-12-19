//
//  MoreViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class MoreViewController: BaseViewController {

    lazy var listView: MeSettingTableView = {
        let listView = MeSettingTableView.init()
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(self.listView)
        configLayou()
        
    }
    func configLayou() {
        self.listView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }

  

}
