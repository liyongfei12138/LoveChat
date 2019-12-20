//
//  DetailTableView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/20.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit


class DetailTableView: UITableView {

    var dataArr : [Dictionary<String,Any>] = []
    
}
 
extension DetailTableView{
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
    
    func configData(dataArr:[Dictionary<String,Any>]) {
        self.dataArr = dataArr
        self.reloadData()
        
    }
}

extension DetailTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell:DetailTableViewCell = DetailTableViewCell.reusableCell(tableView: tableView) as! DetailTableViewCell
//        cell.backgroundColor = .random
        cell.configData(women: self.dataArr[indexPath.section]["title"] as! String, man: self.dataArr[indexPath.section]["content"] as! String)
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
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
