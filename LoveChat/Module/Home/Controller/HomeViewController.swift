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
                        let models: [HomePageModel]? = [HomePageModel].deserialize(from: list) as? [HomePageModel]
                        print(models)
                        self.listView.updateList(models: models)
                    }
                }
                
                
            }
        }
        
    }
    
    lazy var listView: HomeListView = {
        let listView = HomeListView.init(frame: .zero)
        listView.selectedBlock = { (_ indexPath: IndexPath, _ title: String?) in
            
            print("index: \(indexPath), title: \(title)")
            
        }
        return listView
    }()

}
