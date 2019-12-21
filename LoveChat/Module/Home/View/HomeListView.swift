//
//  HomeListView.swift
//  LoveChat
//
//  Created by walker on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit
import SnapKit
class HomeListView: BaseView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var dataModels: [HomePageModel]?
    let listCell_id_1: String = "listCell_id_1"
    let listHeadReuseId_1: String = "listHeadReuseId_1"
    let listSectionHeadReuseId_1: String = "listSectionHeadReuseId_1"
    
    let HEAD_VIEW_1_HEIGHT: CGFloat = 200
    let HEAD_VIEW_2_HEIGHT: CGFloat = 40
    // 选中标题
    var selectedBlock: ((_ indexPath: IndexPath, _ title: String?, _ index: String?) -> ())?
    // 点击搜索
    var searchAction: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        p_initlize()
        
        p_setUpUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func gl_customInitialize() {
        super.gl_customInitialize()
        
    }
    
    //MARK: public method
    func updateList(models: [HomePageModel]?) {
        
        self.dataModels = models
        self.homeListView.reloadData()
    }
    
    //MARK: private Method
    func p_initlize() {
        
    }
    
    
    func p_setUpUI() {
        self.addSubview(self.homeListView)
        
        self.homeListView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalTo(self)
        }
    }
    
    
    
    //MARK: delegat ---
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return self.dataModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let pageModel: HomePageModel? = self.dataModels?[section]
        
        return pageModel?.content.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pageModel: HomePageModel? = self.dataModels?[indexPath.section]
        
        let cell: HomeListCell = collectionView.dequeueReusableCell(withReuseIdentifier: listCell_id_1, for: indexPath) as! HomeListCell
        
        let item: HomeListItem? = pageModel?.content[indexPath.item]
        
        if item != nil {
            cell.updateData(model: item!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.selectedBlock != nil {
            
            var title: String?
            var index: String?
            
            let pageModel: HomePageModel? = self.dataModels?[indexPath.section]
            
            let item: HomeListItem? = pageModel?.content[indexPath.item]
            
            if item != nil {
                title = item?.title
                index = item?.index
            }
            
            self.selectedBlock!(indexPath, title, index)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let pageModel: HomePageModel? = self.dataModels?[indexPath.section]
        
        let title: String? = pageModel?.title
        let color: UIColor = UIColor.init(hexString: pageModel?.color ?? "") ?? ColorTheme
        
        if indexPath.section == 0 {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: String.gl_fromClass(Class: UICollectionReusableView.self), withReuseIdentifier: listHeadReuseId_1, for: indexPath)
            
            self.header2.markView.backgroundColor = color
            self.header2.titleLabel.text = title
            headerView.addSubview(self.header1)
            headerView.addSubview(self.header2)
            
            self.header1.snp.remakeConstraints { (make) in
                make.left.top.right.equalToSuperview()
                make.size.equalTo(CGSize.init(width: SCREEN_WIDTH, height: HEAD_VIEW_1_HEIGHT))
            }
            
            self.header2.snp.remakeConstraints { (make) in
                make.top.equalTo(self.header1.snp.bottom)
                make.left.right.equalToSuperview()
                make.size.equalTo(CGSize.init(width: SCREEN_WIDTH, height: HEAD_VIEW_2_HEIGHT))
            }
            headerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: HEAD_VIEW_1_HEIGHT + HEAD_VIEW_2_HEIGHT)
            return headerView
        }else {
            let header: HomeSectionView = collectionView.dequeueReusableSupplementaryView(ofKind: String.gl_fromClass(Class: UICollectionReusableView.self), withReuseIdentifier: listSectionHeadReuseId_1, for: indexPath) as! HomeSectionView
            header.markView.backgroundColor = color
            header.titleLabel.text = title
            header.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: HEAD_VIEW_2_HEIGHT)
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        var size = CGSize.zero
        
        if section == 0 {
            size = CGSize.init(width: SCREEN_WIDTH, height: HEAD_VIEW_1_HEIGHT + HEAD_VIEW_2_HEIGHT)
        }else {
            size = CGSize.init(width: SCREEN_WIDTH, height: HEAD_VIEW_2_HEIGHT)
        }
        
        return size
    }
    
    
    //MARK: lazy load --
    lazy var listLayout: UICollectionViewFlowLayout = {
        let listLayout = UICollectionViewFlowLayout.init()
        
        listLayout.itemSize = CGSize.init(width: (SCREEN_WIDTH - (20*4)) / 3, height: 50)
        listLayout.minimumLineSpacing = 20.0
        listLayout.minimumInteritemSpacing = 20.0
        listLayout.sectionInset = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 20)
        return listLayout
    }()
    
    lazy var homeListView: UICollectionView = {
        let homelistView = UICollectionView.init(frame: .zero, collectionViewLayout: self.listLayout)
        homelistView.register(HomeListCell.self, forCellWithReuseIdentifier: listCell_id_1)
        homelistView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: String.gl_fromClass(Class: UICollectionReusableView.self), withReuseIdentifier: listHeadReuseId_1)
        homelistView.register(HomeSectionView.self, forSupplementaryViewOfKind: String.gl_fromClass(Class: UICollectionReusableView.self), withReuseIdentifier: listSectionHeadReuseId_1)
        homelistView.dataSource = self
        homelistView.delegate = self
        homelistView.backgroundColor = .white
        return homelistView
    }()
    
    lazy var header1: HomeHeadView = {
        let header1 = HomeHeadView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: HEAD_VIEW_1_HEIGHT))
        header1.searchAction = self.searchAction
        return header1
    }()
    
    lazy var header2: HomeSectionView = {
        let header2 = HomeSectionView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: HEAD_VIEW_2_HEIGHT))
        return header2
    }()
    
}
