//
//  HomeHeadView.swift
//  LoveChat
//
//  Created by walker on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class HomeHeadView: UICollectionReusableView {
    
    // 点击搜索
    var searchAction: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        p_initialize()
        
        p_setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func p_initialize(){
        
    }
    
    
    func p_setUpUI(){
        
        self.addSubview(self.backView)
        
        self.backView.addSubview(self.iconView)
        self.backView.addSubview(self.searchInputView)
        
        p_layout()
    }
    
    func p_layout(){
        
        self.backView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        self.iconView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.size.equalTo(CGSize.init(width: 300, height: 90))
            make.centerX.equalToSuperview()
        }
        
        self.searchInputView.snp.makeConstraints { (make) in
            make.top.equalTo(self.iconView.snp.bottom).offset(20)
            make.size.equalTo(CGSize.init(width: 320, height: 38))
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func p_searchAction() {
        
        if self.searchAction != nil {
            self.searchAction!()
        }
        
    }
    
    //MARK: lazy load
    
    lazy var iconView: UIImageView = {
        
        let iconView = UIImageView.init(frame: .zero)
        iconView.image = UIImage.init(named: "title_bg")
        iconView.contentMode = .scaleAspectFit
        return iconView
    }()
    
    lazy var backView: UIView = {
        
        let backView = UIView.init(frame: .zero)
        backView.bbc_addGradient(startPoint: GradientPoint.top, endPoint: GradientPoint.bottom)
        return backView
    }()
 
    lazy var searchInputView: UIButton = {
        let searchInputView = UIButton.init(frame: .zero)
        
        searchInputView.addTarget(self, action: #selector(p_searchAction), for: UIControl.Event.touchUpInside)
        searchInputView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        searchInputView.setTitle(" 搜一下", for: .normal)
        searchInputView.setTitleColor(UIColor.init(hex: 0x666666), for: .normal)
        searchInputView.setImage(UIImage.init(named: "icon_search"), for: .normal)
        searchInputView.cornerRadius = 5
        searchInputView.addShadow()
        return searchInputView
    }()
}
