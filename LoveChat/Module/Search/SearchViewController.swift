//
//  SearchViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController ,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var dataSource: [DetailModel]?
    private var allDataSource: [DetailModel]?
    private let searchVC_listView_cell_id = "searchVC_listView_cell_id"
    
    var searchSelectedAction: ((_ title: String?)->())? {
        didSet{
            print("didset----:\(self.searchSelectedAction)")
        }
    }
    
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
            self.allDataSource = [DetailModel]()
        }
        
        
        if IAPManager.stand.isPay() {
            // 已经购买
            let allItems: [HomeListItem] = GetJson.getIndexAllItems()
            for item in allItems {
                
                let detailList: [DetailModel] = GetJson.getDetailList(index: item.index)
                
                self.allDataSource! += detailList
            }
            
        }else {
            // 未购买
            let allItems: [HomeListItem] = GetJson.getIndexAllItems()
            for item in allItems {
                
                let detailList: [DetailModel] = GetJson.getDetailList(index: item.index)
                
                if detailList.first != nil {
                    self.allDataSource?.append(detailList.first!)
                }
            }
        }
    }
    
        func p_filter(searchText: String?) {
    
            if !String.gl_empty(string: searchText) && self.allDataSource != nil {

                let result: [DetailModel]? = ZYPinYinSearch.search(withOriginalArray: self.allDataSource!, andSearchText: searchText ?? "", andSearchByPropertyName: "title") as? [DetailModel]
                
                
                if result != nil {
    
                    self.dataSource?.removeAll()
    
                    self.dataSource = result!
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
        searchBar.returnKeyType = .search
        searchBar.backgroundColor = .white
        return searchBar
    }()
    
    lazy var navImgView: UIImageView = {
        let navImgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 138, height: 38))
        navImgView.contentMode = .scaleAspectFit
        navImgView.image = UIImage.init(named: "icon_nav_title")
        return navImgView
    }()
    
    lazy var listView: UITableView = {
        let listView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        listView.backgroundColor = ColorTableViewBG
        listView.separatorStyle = .none
        listView.dataSource = self
        listView.delegate = self
        listView.register(DetailTableViewCell.self, forCellReuseIdentifier: searchVC_listView_cell_id)
        return listView
    }()
    
}

extension SearchViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item: DetailModel = self.dataSource![indexPath.section]
        
        let cell: DetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: searchVC_listView_cell_id, for: indexPath) as! DetailTableViewCell
        
        cell.configData(women: item.title, man: item.content)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item: DetailModel = self.dataSource![indexPath.row]
        
        if self.searchSelectedAction != nil {
            self.searchSelectedAction!(item.title)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
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
        if String.gl_empty(string: searchText) {
            self.dataSource?.removeAll()
            self.listView.reloadData()
        }
    }
}
