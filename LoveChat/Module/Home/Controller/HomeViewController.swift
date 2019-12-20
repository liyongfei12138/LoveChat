//
//  HomeViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit
import HandyJSON
class HomeViewController: BaseViewController {

    var dataModels: [HomePageModel]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.moreBtn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p_initlize()
        
        p_setUpUI()
        
        p_loadData()
    }
     
    func p_initlize() {
        self.title = "恋爱话术"

    }
    
    func p_setUpUI(){
        
        self.view.addSubview(self.listView)
        
        p_layout()
    }

    func p_layout(){
        self.listView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    func p_loadData() {
        
        let jsonPath: String? = Bundle.main.path(forResource: "index", ofType: "json")
        if jsonPath != nil {
            let data: Data? = FileManager.default.contents(atPath: jsonPath!)
            
            if data != nil {
                let object: [String: Any]? = try? data!.jsonObject() as? [String: Any]
                
                if object != nil {
                    let dataDict: [String: Any]? = object!["data"] as? [String: Any]
                    print(dataDict)
                    
                    if dataDict != nil {
                        
                        let list: [Any]? = dataDict?["list"] as? [Any]
                        self.dataModels = [HomePageModel].deserialize(from: list) as? [HomePageModel]
                        print(self.dataModels!)
                        self.listView.updateList(models: self.dataModels)
                    }
                }
                
                
            }
        }
        
    }
    
     @objc func clickMoreBtn(){
        let moreVC = MoreViewController()
        self.navigationController?.pushViewController(moreVC, animated: true)
        
    }
  
    // 获得所有话术
    func p_getAllItems() -> [HomeListItem] {
        
        var allItems = [HomeListItem]()
        
        if self.dataModels != nil {
            for pageModel in self.dataModels! {
             
                allItems = allItems + pageModel.content
            }
        }
        return allItems
    }
    
    //MARK: lazy load 
    
    lazy var listView: HomeListView = {
        let listView = HomeListView.init(frame: .zero)
        listView.selectedBlock = {[weak self] (_ indexPath: IndexPath, _ title: String?)  in
            
            print("index: \(indexPath), title: \(title)")
            let detailvc = DetailViewController.init(title:title ?? "")
            self?.navigationController?.pushViewController(detailvc, animated: true)
        }
        
        listView.searchAction = { [weak self] () in
            
            print("搜索事件")
            let searchVC = SearchViewController.init(allDataSource: self?.p_getAllItems())
            
            searchVC.searchSelectedAction = { [weak self] (title: String?) in
                
                if title != nil {

                    let detailvc = DetailViewController.init(title:title ?? "")
                    self?.navigationController?.pushViewController(detailvc, animated: true)
                }
            }
            
            self?.navigationController?.pushViewController(searchVC, animated: true)
        }
        
        return listView
    }()

    private lazy var moreBtn: UIButton = {
        let moreBtn = UIButton.init(type: .custom)
        moreBtn.setImage(UIImage(named: "home_more"), for: .normal)
        moreBtn.addTarget(self, action: #selector(clickMoreBtn), for: .touchUpInside)
        return moreBtn
    }()
}
