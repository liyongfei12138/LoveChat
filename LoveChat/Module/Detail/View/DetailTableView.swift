//
//  DetailTableView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/20.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

protocol CopyTextDelegate {
    func copyTextWith(manText:String,women:String)
}

typealias ClickLockBlock = () -> ()
class DetailTableView: UITableView {

    var dataArr : [Dictionary<String,Any>] = []
    var isShow : Bool = false
    
    var lockBlock : ClickLockBlock!
    var copyDelegate : CopyTextDelegate?
    
    
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
    
    func configData(dataArr:[Dictionary<String,Any>],isShow:Bool = false) {
        self.dataArr = dataArr
        self.isShow = isShow
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

        self.copyDelegate?.copyTextWith(manText:  self.dataArr[indexPath.section]["content"] as! String, women:  self.dataArr[indexPath.section]["title"] as! String)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if self.isShow {
            return UIView()
        }else{
//            return CGFloat.leastNormalMagnitude
            let view = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 50))
            let btn = UIButton.init(type: UIButton.ButtonType.custom)
            btn.frame = view.bounds
            btn.backgroundColor = UIColor.black
            btn.alpha = 0.5
            btn.setImage(UIImage.init(named: "jiesuo"), for: .normal)
            btn.setTitle("解锁更多话术", for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.addTarget(self, action: #selector(clickLockBtn), for: .touchUpInside)
            view.addSubview(btn)
            return view
            
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headView = UIView()
        headView.backgroundColor = ColorTableViewBG
        return headView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        
        if self.isShow {
            return CGFloat.leastNormalMagnitude
        }else{
            return 50
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    @objc func clickLockBtn(){
        self.lockBlock!()
    }
}
