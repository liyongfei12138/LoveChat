//
//  DetailTableViewCell.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/20.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    private lazy var womenIcon: UIImageView = {
        let womenIcon = UIImageView()
        womenIcon.image = UIImage(named: "women")
        return womenIcon
    }()
    private lazy var womenLabel: UILabel = {
        let womenLabel = UILabel()
        womenLabel.font = UIFont.systemFont(ofSize: 15)
        womenLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        womenLabel.text = ""
        womenLabel.numberOfLines = 0
        return womenLabel
    }()
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    private lazy var manIcon: UIImageView = {
        let manIcon = UIImageView()
        manIcon.image = UIImage(named: "man")
        return manIcon
    }()
    private lazy var manLabel: UILabel = {
        let manLabel = UILabel()
        manLabel.font = UIFont.systemFont(ofSize: 13)
        manLabel.textColor = UIColor.gl_hex(hex: 0x666666)
        manLabel.text = ""
        manLabel.numberOfLines = 0
        return manLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(self.womenIcon)
        self.addSubview(self.womenLabel)
        self.addSubview(self.lineView)
        self.addSubview(self.manIcon)
        self.addSubview(self.manLabel)
        self.selectionStyle = .none
        configLayout()
    }
    func configData(women:String,man:String)  {
        self.womenLabel.text = women
        self.manLabel.text = man
    }
    func configLayout()  {
        self.womenIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        self.womenLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.womenIcon.snp.right).offset(10)
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(self.womenIcon)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self.womenLabel)
            make.right.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(self.womenLabel.snp.bottom).offset(22)
        }
        self.manIcon.snp.makeConstraints { (make) in
            make.left.equalTo(self.womenIcon)
//            make.top.equalTo(self.lineView.snp.bottom).offset(16)
            make.centerY.equalTo(self.manLabel)
            make.size.equalTo(self.womenIcon)
        }
        self.manLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.womenIcon.snp.right).offset(10)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(self.lineView.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-16)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
