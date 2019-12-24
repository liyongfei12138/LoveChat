//
//  YFHomeViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/24.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class YFHomeViewController: BaseViewController {

    private lazy var navView: YFHomeNavView = {
        let navView = YFHomeNavView.init()
        navView.clickDelegate = self
        return navView
    }()
    lazy var listView: YFHomeTableView = {
        let listView = YFHomeTableView.init()
        return listView
    }()
    
    lazy var listHeadView: YFHomeHeadView = {
        let listHeadView = YFHomeHeadView.init()
        listHeadView.bannarBlock = { (tag) in
            self.clickBtn(tag: tag)
        }
        return listHeadView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pt_hiddenNav(hide: true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.pt_hiddenNav(hide: false, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.listView.tableHeaderView = self.listHeadView
        self.view.addSubview(self.navView)
        self.view.addSubview(self.listView)
        configLayou()
            
    }
    func configLayou() {
        self.listView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(Nav_topH)
        }
    }

    func clickBtn(tag:Int)  {
        
        switch tag {
            case 0:
                let detailvc = DetailViewController.init(title:"开场白", index:"content0001")
                self.navigationController?.pushViewController(detailvc, animated: true)
            break
            case 1:
                let detailvc = DetailViewController.init(title: "幽默聊天", index:"content0003" )
                self.navigationController?.pushViewController(detailvc, animated: true)
            break
            case 2:
                let detailvc = DetailViewController.init(title:"搭讪话术", index:"content0002" )
                self.navigationController?.pushViewController(detailvc, animated: true)
            break
            case 3:
                let detailvc = DetailViewController.init(title:"情感共鸣", index:"content0027" )
                self.navigationController?.pushViewController(detailvc, animated: true)
            break
            case 4:
                let detailvc = DetailViewController.init(title:"隐性诱惑", index:"content0029" )
                self.navigationController?.pushViewController(detailvc, animated: true)
            break
            case 5:
                
            break
        default:
        break
            
        }
    }

}
extension YFHomeViewController:ClicHomekNavDelegate{
    func clickNavWith(type: HomeNavType) {
        if type == .more {
            let moreVC = MoreViewController()
            self.navigationController?.pushViewController(moreVC, animated: true)
        }else{
            let searchVC = SearchViewController.init()
            self.navigationController?.pushViewController(searchVC)
        }
    }
    
    
}
