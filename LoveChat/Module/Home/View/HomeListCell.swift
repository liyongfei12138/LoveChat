//
//  HomeListCell.swift
//  LoveChat
//
//  Created by walker on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class HomeListCell: UICollectionViewCell {
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel.init()
        textLabel.text = "--"
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    var item: HomeListItem?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        p_initialize()
        
        p_setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func p_initialize() {
        self.contentView.backgroundColor = .white
        self.contentView.cornerRadius = 5.0
        self.contentView.borderColor = UIColor.init(hex: 0x999999)
        self.contentView.borderWidth = 0.5
//        self.contentView.addShadow()
    }
    
    func p_setUpUI() {
        
        self.contentView.addSubview(self.textLabel)
        
        p_layout()
    }
    
    func p_layout(){
        
        self.textLabel.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.contentView)
        }
    }
    
    func updateData(model: HomeListItem) {
        self.item = model
        
        self.textLabel.text = item?.title ?? "--"
    }

}

