//
//  YFHomeMoreViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/27.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class YFHomeMoreViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "更多话术"
        
        self.p_setUpUI()
        
        self.p_reloadData()
    }
    
    func p_setUpUI(){
        
        self.view.addSubview(self.listView)
        self.p_layout()
    }
    
    func p_layout(){
    
        self.listView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
    }
    
    func p_reloadData() {
        
        let dataModels = GetJson.getIndexPageModel()
        self.listView.updateList(models: dataModels)
    }
    
    
    lazy var listView: HomeListView = {
        let listView = HomeListView.init(frame: .zero)
        listView.selectedBlock = {[weak self] (_ indexPath: IndexPath, _ title: String?, _ index: String?)  in
            
            print("index: \(indexPath), title: \(title)")
            let detailvc = DetailViewController.init(title:title ?? "", index:index ?? "" )
            self?.navigationController?.pushViewController(detailvc, animated: true)
        }
        
//        listView.searchAction = { [weak self] () in
//
//            print("搜索事件")
//            let searchVC = SearchViewController.init()
//
//            searchVC.searchSelectedAction = { [weak self] (title: String?) in
//
//                if title != nil {
//
//                    let detailvc = DetailViewController.init(title:title ?? "")
//                    self?.navigationController?.pushViewController(detailvc, animated: true)
//                }
//            }
//
//            self?.navigationController?.pushViewController(searchVC, animated: true)
//        }
        
        return listView
    }()

}
