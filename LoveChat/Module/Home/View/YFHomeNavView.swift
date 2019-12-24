//
//  DetailNavView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/20.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

public  enum HomeNavType: Int  {
    case more
    case search
    case other
}

protocol ClicHomekNavDelegate {
    func clickNavWith(type:HomeNavType)
}

class YFHomeNavView: UIView {

    
    var clickDelegate : ClicHomekNavDelegate?
    
    
    private lazy var moreBtn: UIButton = {
        
        let moreBtn = UIButton.init(type: UIButton.ButtonType.custom)
        moreBtn.setImage(UIImage.init(named: "home_more"), for: .normal)
        moreBtn.setTitleColor(ColorTheme, for: .normal)
        moreBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        moreBtn.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        return moreBtn
    }()
//

    private lazy var searchBtn: UIButton = {
        
        let searchBtn = UIButton.init(type: UIButton.ButtonType.custom)
        searchBtn.backgroundColor =  ColorLineBG
        searchBtn.alpha = 1
        searchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        searchBtn.setTitle("请输入对方的说的话进行搜索", for: .normal)
        searchBtn.setTitleColor(UIColor.gl_hex(hex: 0x999999), for: .normal)
        searchBtn.addTarget(self, action: #selector(clickSearch), for: .touchUpInside)
        searchBtn.cornerRadius = 13
        return searchBtn
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = ColorTheme
        self.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: Nav_topH)
        self.addSubview(self.moreBtn)
        self.addSubview(self.searchBtn)
        self.addSubview(self.lineView)
        configLayout()
    }
    
    
    
    func configLayout()  {
        
        self.searchBtn.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().offset(-10)
            
            make.right.equalToSuperview().offset(-57)
            make.height.equalTo(30)
        }
        
        self.moreBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-12)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
        
    }
    
    @objc func clickSearch()  {
        self.clickDelegate?.clickNavWith(type: HomeNavType.search)
    }
    
    @objc func clickBack()  {
        self.clickDelegate?.clickNavWith(type: HomeNavType.more)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
