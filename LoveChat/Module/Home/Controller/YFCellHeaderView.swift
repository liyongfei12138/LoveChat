//
//  YFCellHeaderView.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/24.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

typealias HomeCellMoreBlock = () -> ()

class YFCellHeaderView: UIView {

    var moreBlock : HomeCellMoreBlock!
    
    
    private lazy var moreBtn: UIButton = {
        
        let moreBtn = UIButton.init(type: UIButton.ButtonType.custom)
        moreBtn.setImage(UIImage.init(named: "home_cell_more"), for: .normal)
        moreBtn.setTitleColor(UIColor.gl_hex(hex: 0x999999), for: .normal)
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        moreBtn.setTitle("查看更多", for: .normal)
        moreBtn.layoutButton(style: .Right, imageTitleSpace: 15)
        moreBtn.addTarget(self, action: #selector(clickMore), for: .touchUpInside)
        return moreBtn
    }()
//
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.text = "每日精选"
        titleLabel.textColor = UIColor.gl_hex(hex: 0x333333)
        return titleLabel
    }()

    private lazy var BLineView: UIView = {
        let BLineView = UIView()
        BLineView.backgroundColor = ColorTheme
        return BLineView
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = ColorWhite
        self.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 40)
        self.addSubview(self.moreBtn)
        self.addSubview(self.titleLabel)
        self.addSubview(self.BLineView)
        self.addSubview(self.lineView)
        configLayout()
    }
    
    
    
    func configLayout()  {
        
        self.BLineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.size.equalTo(CGSize(width: 3, height: 20))
            make.centerY.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.BLineView.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
   
        
        self.moreBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
        
    }
    

    @objc func clickMore()  {
        self.moreBlock!()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
