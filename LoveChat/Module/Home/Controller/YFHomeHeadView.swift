//
//  YFHomeHeadView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/25.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit
import ZCycleView
import Kingfisher

typealias BannarBlock = (_ tag:Int) -> ()

class YFHomeHeadView: UIView {

    var bannarBlock : BannarBlock!
    
    
    private lazy var dataArr: [Dictionary<String,Any>] = {
        let dataArr = HomeBannarModel.getBannarData()
        return dataArr
    }()

    private lazy var cycleView: ZCycleView = {
        let cycleView = ZCycleView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.2))
        cycleView.placeholderImage = UIImage(named: "icon")
    cycleView.setUrlsGroup(["https://s2.ax1x.com/2019/12/26/lAbsZq.png"])
        cycleView.delegate = self
//        cycleView.col = .scaleToFill
        
        return cycleView
    }()

    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorTableViewBG
        return lineView
    }()
    
    init(frame: CGRect = .zero,title:String = "") {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.4 + 10)
        self.backgroundColor = ColorWhite
        self.addSubview(self.lineView)
        self.addSubview(self.cycleView)
        self.configBannarBtn()
        configLayout()
    }
    
    func configBannarBtn() {
        
        let space = CGFloat(30.0)
        
        let btnW = (SCREEN_WIDTH - (space * 4)) / 3
        let btnH = (SCREEN_HEIGHT * 0.2 * 0.5 * 0.8)
        let topSpace = (SCREEN_HEIGHT * 0.2 * 0.5 * 0.13)
        
        
        
        for index in 0...self.dataArr.count - 1 {
            let info = self.dataArr[index]
            
            let btn = HomeBannarView.init(frame: CGRect(x: space + (CGFloat(index % 3) * (btnW + space)), y: topSpace + (CGFloat(Int(index / 3)) * (btnH + topSpace)) + (SCREEN_HEIGHT * 0.2), width: btnW, height: btnH))
            btn.tag = index
            btn.addViewTapTarget(self, action: #selector(clickBtnWith(tap:)))
            btn.configData(info:info)
            self.addSubview(btn)
            
        }
    }
    
    @objc func clickBtnWith(tap:UITapGestureRecognizer) {
        
        
        self.bannarBlock!(tap.view?.tag ?? 999)
    }
    
    func configLayout()  {

        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(10)
            make.bottom.equalToSuperview()
        }
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension YFHomeHeadView:ZCycleViewProtocol{
    
    func cycleViewConfigureDefaultCellImageUrl(_ cycleView: ZCycleView, imageView: UIImageView, imageUrl: String?, index: Int) {
       
        imageView.contentMode = .scaleAspectFill
        imageView.kf.setImage(with: URL(string: imageUrl!), placeholder: cycleView.placeholderImage)
        
    }
}
