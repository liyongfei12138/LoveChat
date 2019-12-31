//
//  YFHomeTableView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/24.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

protocol ClickSelectDelegate {
    func clickSelectWith(info:Dictionary<String,Any>,row:Int)
}

class YFHomeTableView: UITableView {
    var clickDelegate :ClickSelectDelegate?
    
}
 
extension YFHomeTableView{
    convenience init() {
        self.init(frame:.zero,style:.grouped)
        self.delegate = self
        self.dataSource = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = ColorTableViewBG
        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 44
    }
}

extension YFHomeTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell:YFHomeTableViewCell = YFHomeTableViewCell.reusableCell(tableView: tableView) as! YFHomeTableViewCell
        cell.configData()
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.clickDelegate?.clickSelectWith(info: [:], row: indexPath.row)
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headView = YFCellHeaderView()
        headView.moreBlock = {
            self.clickDelegate?.clickSelectWith(info: [:], row: 999)
        }
        return headView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

