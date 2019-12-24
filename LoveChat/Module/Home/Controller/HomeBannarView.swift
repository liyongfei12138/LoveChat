//
//  HomeBannarView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/25.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class HomeBannarView: UIView {

    private lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        
        iconImgView.contentMode = .scaleAspectFill
        return iconImgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x333333)
        return titleLabel
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        self.backgroundColor = ColorWhite
        self.addSubview(self.iconImgView)
        self.addSubview(self.titleLabel)
        configLayout()
    }
    func configData(info:Dictionary<String,Any>) {
        self.titleLabel.text = info["title"] as? String
        self.iconImgView.image = UIImage.init(named: info["icon"] as! String)
    }
        
    func configLayout()  {
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.frame.width * 0.5)
            make.bottom.equalToSuperview()
        }
        
        self.iconImgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.frame.width * 0.5)
            make.bottom.equalTo(self.titleLabel.snp.top).offset(-8)
            make.height.equalTo(self.frame.height * 0.6)
            make.width.equalTo(self.frame.height * 0.6)
        }
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
