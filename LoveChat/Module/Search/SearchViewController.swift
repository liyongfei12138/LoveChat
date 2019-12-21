//
//  SearchViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController ,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var dataSource: [HomeListItem]?
    private var allDataSource: [HomeListItem]?
    private let searchVC_listView_cell_id = "searchVC_listView_cell_id"
    
    var searchSelectedAction: ((_ title: String?)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p_initialize()
        
        p_setUpUI()
        
        p_loadData()
    }
    
    func p_initialize(){
        
        self.dataSource = self.allDataSource
    }
    
    func p_setUpUI(){
        self.navigationItem.titleView = self.navImgView
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.listView)
        
        p_layout()
    }
    
    func p_layout(){
        
        self.searchBar.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
        }
        self.listView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func p_loadData() {
        
        if self.allDataSource != nil {
            self.allDataSource?.removeAll()
            
        }else {
            self.allDataSource = [HomeListItem]()
        }
        
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
                        let dataModels: [HomePageModel]? = [HomePageModel].deserialize(from: list) as? [HomePageModel]
                        
                        if dataModels != nil {
                            for pageModel in dataModels! {
                                
                                self.allDataSource = self.allDataSource! + pageModel.content
                            }
                            self.dataSource = self.allDataSource
                        }
                    }
                }
            }
        }
        
        
        self.listView.reloadData()
        
    }
    
    func p_filter(searchText: String?) {
        
        if !String.gl_empty(string: searchText) && self.allDataSource != nil {
            
            var allItemTitles: [String] = [String]()
            
            for item in self.allDataSource! {
                
                allItemTitles.append(item.title)
            }
            
            let result: [String]? = ZYPinYinSearch.search(withOriginalArray: allItemTitles, andSearchText: searchText!, andSearchByPropertyName: "") as? [String]
            
            if result != nil {
                
                self.dataSource?.removeAll()
                
                for item in result! {
                    self.dataSource?.append(HomeListItem(title: item))
                }
            }
            
        }else {
            // 为空
            self.dataSource = self.allDataSource
        }
        
        self.listView.reloadData()
    }
    
    //MARK: lazy load
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH - 100, height: 40))
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var navImgView: UIImageView = {
        let navImgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 138, height: 38))
        navImgView.contentMode = .scaleAspectFit
        navImgView.image = UIImage.init(named: "icon_nav_title")
        return navImgView
    }()
    
    lazy var listView: UITableView = {
        let listView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        listView.dataSource = self
        listView.delegate = self
        listView.register(UITableViewCell.self, forCellReuseIdentifier: searchVC_listView_cell_id)
        return listView
    }()
    
}
//
//extension SearchViewController {
//    convenience init(allDataSource: [HomeListItem]?) {
//        self.init()
//        self.allDataSource = allDataSource
//    }
//}

extension SearchViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item: HomeListItem = self.dataSource![indexPath.row]
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: searchVC_listView_cell_id, for: indexPath)
        
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item: HomeListItem = self.dataSource![indexPath.row]
        
        if self.searchSelectedAction != nil {
            self.searchSelectedAction!(item.title)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}


extension SearchViewController {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.view.endEditing(true)
        
        print("did selected search btn")
        
        self.p_filter(searchText: searchBar.text)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search bar text did change, search Text: \(searchText)")
        
        self.p_filter(searchText: searchText)
    }
}
