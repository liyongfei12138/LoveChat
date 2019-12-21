//
//  MoreHeaderView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

typealias ClickIconBlock = ()->()

class MoreHeaderView: UIView {

    var clickBlock : ClickIconBlock!
    
    private lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        iconImgView.image = SaveModel.getHeadImg()
        iconImgView.cornerRadius = 40
        iconImgView.layer.borderColor = UIColor.white.cgColor
        iconImgView.layer.borderWidth = 3
        iconImgView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(clickHeadView))
        iconImgView.addGestureRecognizer(tap)
        
        return iconImgView
    }()
    
    func configImage() {
        self.iconImgView.image = SaveModel.getHeadImg()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor  = ColorTheme
        
        self.addSubview(self.iconImgView)
        configLayou()
            
    }
    func configLayou() {
        self.iconImgView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
    }

    
    @objc func clickHeadView(){
        self.clickBlock!()
    }
    
    public func reloadHeadImg(){
        
        self.iconImgView.image = SaveModel.getHeadImg()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
