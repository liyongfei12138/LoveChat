//
//  DetailNavView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/20.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

public  enum ClickNavType: Int  {
    case back
    case search
    case other
}

protocol ClickNavDelegate {
    func clickNavWith(type:ClickNavType)
}

class DetailNavView: UIView {

    
    var clickDelegate : ClickNavDelegate?
    
    
    private lazy var backBtn: UIButton = {
        
        let backBtn = UIButton.init(type: UIButton.ButtonType.custom)
        backBtn.setImage(UIImage.init(named: "back"), for: .normal)
        backBtn.setTitleColor(ColorTheme, for: .normal)
        backBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        backBtn.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        return backBtn
    }()
//

    private lazy var searchBtn: UIButton = {
        
        let searchBtn = UIButton.init(type: UIButton.ButtonType.custom)
        searchBtn.backgroundColor =  ColorLineBG
        searchBtn.alpha = 1
        searchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        searchBtn.setTitle("搜索", for: .normal)
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
    
    init(frame: CGRect = .zero,title:String = "") {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: Nav_topH)
        self.addSubview(self.backBtn)
        self.addSubview(self.searchBtn)
        self.addSubview(self.lineView)
        self.backBtn.setTitle(title, for: .normal)
        configLayout()
    }
    
    
    
    func configLayout()  {
        
        self.searchBtn.snp.makeConstraints { (make) in
            
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
        
        self.backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(self.searchBtn.snp.left).offset(-20)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
        
    }
    
    @objc func clickSearch()  {
        self.clickDelegate?.clickNavWith(type: ClickNavType.search)
    }
    
    @objc func clickBack()  {
        self.clickDelegate?.clickNavWith(type: ClickNavType.back)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
