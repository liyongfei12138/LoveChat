//
//  YFHomeTableViewCell.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/24.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class YFHomeTableViewCell: UITableViewCell {

    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.text = "【软件使用指南】"
        titleLabel.textColor = UIColor.gl_hex(hex: 0x333333)
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    private lazy var detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.font = UIFont.boldSystemFont(ofSize: 12)
        detailLabel.text = "2019-10-25 20000阅读"
        detailLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        return detailLabel
    }()
    
    private lazy var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.font = UIFont.boldSystemFont(ofSize: 11)
        typeLabel.text = "付费"
        typeLabel.textColor = ColorWhite
        typeLabel.backgroundColor = ColorTheme
        typeLabel.cornerRadius = 3
        typeLabel.textAlignment = .center
        return typeLabel
    }()
    
    private lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        iconImgView.image = UIImage.init(named: "icon")
        iconImgView.contentMode = .scaleAspectFill
        iconImgView.cornerRadius = 3
        return iconImgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.addSubview(self.titleLabel)
        self.addSubview(self.detailLabel)
        self.addSubview(self.iconImgView)
         self.addSubview(self.typeLabel)
        self.addSubview(self.lineView)
    }
    
    func configData()  {
        self.configLayout()
    }
    
    func configLayout()  {
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-0.4 * SCREEN_WIDTH)
        }
        
        self.detailLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
//            make.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            make.left.equalTo(self.titleLabel)
           
        }
        self.typeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.detailLabel.snp.right).offset(5)
            make.centerY.equalTo(self.detailLabel)
            make.height.size.equalTo(CGSize(width: 33, height: 16))
        }
        
        
        let space = 0.05 * SCREEN_WIDTH
        let iconW = 0.3 * SCREEN_WIDTH
        
        let viewH = 70.0
        
        
        self.iconImgView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-space)
            make.width.equalTo(iconW)
            make.height.equalTo(viewH)
           
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
