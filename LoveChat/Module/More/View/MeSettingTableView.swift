//
//  MeSettingTableView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

protocol FR_ClickDelegate {
    
    func fr_clickViewDelegte(type:MoreRowType)
}

class MeSettingTableView: UITableView {
    
    var clickDelegate : FR_ClickDelegate?
    
    
    private lazy var dataArr: [MoreBaseModel] = {
        let dataArr = MoreModel.getMoreListData()
        return dataArr
    }()
    
    private lazy var headView: MoreHeaderView = {
        let headView = MoreHeaderView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 200))
        headView.clickBlock = {
            self.clickDelegate?.fr_clickViewDelegte(type: MoreRowType.headImg)
        }
        return headView
    }()
    


}
 
extension MeSettingTableView{
    convenience init() {
        self.init(frame:.zero,style:.grouped)
        self.delegate = self
        self.dataSource = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = ColorTableViewBG
        self.separatorStyle = .none
        self.tableHeaderView = self.headView
    }
}

extension MeSettingTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.dataArr[indexPath.section]
        
        
        let cell:SettingMainTableViewCell = SettingMainTableViewCell.reusableCell(tableView: tableView) as! SettingMainTableViewCell
        cell.configData(title: model.title ?? "", detail: model.detail ?? "",icon: model.icon)
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let model = self.dataArr[indexPath.section]
        
        self.clickDelegate?.fr_clickViewDelegte(type: model.type ?? .other)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headView = UIView()
        headView.backgroundColor = ColorTableViewBG
        return headView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
}
