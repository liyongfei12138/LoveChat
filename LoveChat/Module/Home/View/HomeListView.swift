//
//  HomeListView.swift
//  LoveChat
//
//  Created by walker on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit
import SnapKit
class HomeListView: BaseView, UICollectionViewDelegate, UICollectionViewDataSource {

    private var dataModels: [HomePageModel]?
    
    let listCell_id_1: String = "listCell_id_1"
    
    var selectedBlock: ((_ indexPath: IndexPath, _ title: String?) -> ())?
    
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
            
            let pageModel: HomePageModel? = self.dataModels?[indexPath.section]

            let item: HomeListItem? = pageModel?.content[indexPath.item]
            
            if item != nil {
                title = item?.title
            }
            
            self.selectedBlock!(indexPath, title)
        }
    }
    
    
    //MARK: lazy load --
    lazy var listLayout: UICollectionViewFlowLayout = {
        let listLayout = UICollectionViewFlowLayout.init()
        
        listLayout.itemSize = CGSize.init(width: 100, height: 100)
        listLayout.minimumLineSpacing = 10.0
        listLayout.minimumInteritemSpacing = 10.0
        listLayout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        return listLayout
    }()
    
    lazy var homeListView: UICollectionView = {
        let homelistView = UICollectionView.init(frame: .zero, collectionViewLayout: self.listLayout)
        homelistView.register(HomeListCell.self, forCellWithReuseIdentifier: listCell_id_1)
        homelistView.dataSource = self
        homelistView.delegate = self
        homelistView.backgroundColor = .white
        return homelistView
    }()

}
