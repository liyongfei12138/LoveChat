//
//  SearchViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit
import PKHUD

class SearchViewController: BaseViewController ,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var dataSource: [DetailModel]?
    private var allDataSource: [DetailModel]?
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
            self.allDataSource = [DetailModel]()
        }
        
        
        // 已经购买
        let allItems: [HomeListItem] = GetJson.getIndexAllItems()
        for item in allItems {
            
            let detailList: [DetailModel] = GetJson.getDetailList(index: item.index)
            
            self.allDataSource! += detailList
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
    
    @objc func p_clickLockBtn() {
        let alert = UIAlertController.init(title: "解锁更多话术?", message: "点击【确定】解锁更多话术", preferredStyle: UIAlertController.Style.alert)
        let action1 = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default) { (action) in
            
            self.pay()
            
        }
        let action2 = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel) { (action) in
            
        }
        
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func pay() {
        
        HUD.show(HUDContentType.progress, onView: nil)
        
        IAPManager.stand.payProductId(success: {
            
            HUD.hide()
            self.p_unlockAllData()
            
        }, fail: {
            
            HUD.hide()
            
            let alert = UIAlertController.init(title: "", message: "支付失败，请稍后再试", preferredStyle: UIAlertController.Style.alert)
            let action1 = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default) { (action) in
            }
            
            alert.addAction(action1)
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    func p_unlockAllData() {
        
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
        var section = 0
        
        section = self.dataSource?.count ?? 0
        
        if !IAPManager.stand.isPay() && section > 1 {
            section = 1
        }
        
        return section
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
        
        
        var view: UIView = UIView()
        
        if !IAPManager.stand.isPay() {
            view = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 50))
            let btn = UIButton.init(type: UIButton.ButtonType.custom)
            btn.frame = view.bounds
            btn.backgroundColor = UIColor.black
            btn.alpha = 0.5
            btn.setImage(UIImage.init(named: "jiesuo"), for: .normal)
            btn.setTitle("解锁更多话术", for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.addTarget(self, action: #selector(p_clickLockBtn), for: .touchUpInside)
            view.addSubview(btn)
            
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if !IAPManager.stand.isPay() {
            return 50
        }else {
            return CGFloat.leastNormalMagnitude
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
        if String.gl_empty(string: searchText) {
            self.dataSource?.removeAll()
            self.listView.reloadData()
        }
    }
}
