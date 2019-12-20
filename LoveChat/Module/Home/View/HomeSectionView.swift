//
//  HomeSectionView.swift
//  LoveChat
//
//  Created by walker on 2019/12/20.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class HomeSectionView: UICollectionReusableView {
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
        
        self.backView.addSubview(self.markView)
        self.backView.addSubview(self.titleLabel)
        
        p_layout()
    }
    
    func p_layout(){
        
        self.backView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        self.markView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.size.equalTo(CGSize.init(width: 3, height: 20))
            make.centerY.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.markView.snp.right).offset(20)
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: lazy load
    
    lazy var backView: UIView = {
        
        let backView = UIView.init(frame: .zero)
        return backView
    }()
    
    lazy var markView: UIView = {
        
        let markView = UIView.init(frame: .zero)
        markView.backgroundColor = ColorTheme
        markView.cornerRadius = 1.5
        markView.addShadow()
        return markView
    }()

    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: .zero)
        titleLabel.font = UIFont.init(name: FontNameDIN, size: 15)
        titleLabel.textColor = UIColor.init(hex: 0x333333)
        titleLabel.text = "常用恋爱话术"
        return titleLabel
    }()
}
