//
//  YFSelectViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/30.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class YFSelectViewController: UIViewController {

    lazy var listView: YFHomeTableView = {
        let listView = YFHomeTableView.init()
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "每日精选"
        self.view.addSubview(self.listView)
        
        self.configLyout()
    }
    
    func configLyout()  {
        self.listView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }

}
