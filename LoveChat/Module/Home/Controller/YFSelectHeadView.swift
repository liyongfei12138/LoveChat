//
//  YFSelectHeadView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/31.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class YFSelectHeadView: UIView {

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.text = "如何让女生爱上你"
        titleLabel.textColor = UIColor.gl_hex(hex: 0x333333)
        return titleLabel
    }()
    
    private lazy var detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.font = UIFont.systemFont(ofSize: 12)
        detailLabel.text = "2019-09-22 阅读999次"
        detailLabel.textColor = UIColor.gl_hex(hex: 0x666666)
        return detailLabel
    }()
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 70)
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.detailLabel)
        self.addSubview(self.lineView)
        configLyout()
    }
    func configLyout()  {
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        self.detailLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-13)
            make.right.equalToSuperview().offset(-16)
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
