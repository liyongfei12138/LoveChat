//
//  SettingMainTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import SnapKit
class SettingMainTableViewCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        titleLabel.text = ""
        return titleLabel
    }()
    
    private lazy var detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.font = UIFont.systemFont(ofSize: 12)
        detailLabel.textColor = UIColor.gl_hex(hex: 0x666666)
        detailLabel.text = ""
        return detailLabel
    }()
       

    private lazy var arrowImgView: UIImageView = {
        let arrowImgView = UIImageView()
         arrowImgView.image = UIImage(named: "set_arrow")
        return arrowImgView
    }()
    
    private lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        return iconImgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(self.iconImgView)
        addSubview(self.titleLabel)
        addSubview(self.detailLabel)
        addSubview(self.arrowImgView)
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    override func layoutSubviews() {
        super.layoutSubviews()
        configLayout()
    }
    func configData(title:String,detail:String? = "",icon:String? = "")  {
        self.titleLabel.text = title
        self.detailLabel.text = detail
        self.iconImgView.image = UIImage.init(named: icon ?? "")
    }
    private func configLayout()  {

        self.iconImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(18)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImgView.snp.right).offset(12)
            make.centerY.equalTo(self.frame.height * 0.5)
       }

        
        self.arrowImgView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-18)
            make.centerY.equalTo(self.titleLabel)
            make.size.equalTo(CGSize(width: 15, height: 15))
        }
        self.detailLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.arrowImgView.snp.left).offset(-8)
            make.centerY.equalTo(self.titleLabel)
        }
    }
}
