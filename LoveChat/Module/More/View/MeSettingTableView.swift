//
//  MeSettingTableView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

@objc protocol FR_ClickDelegate {
    
    @objc optional func fr_clickViewDelegte(section:Int)
}

class MeSettingTableView: UITableView {
    
    var clickDelegate : FR_ClickDelegate?
    
    
    lazy var dataArr: [MoreBaseModel] = {
        let dataArr = MoreModel.getMoreListData()
        return dataArr
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
        
        let cell:SettingMainTableViewCell = SettingMainTableViewCell.reusableCell(tableView: tableView) as! SettingMainTableViewCell
//        cell.configData(title: self.dataArr[indexPath.section],detail: self.detailArr[indexPath.section])
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.clickDelegate?.fr_clickViewDelegte?(section: indexPath.section)
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
        return 13
    }
}
