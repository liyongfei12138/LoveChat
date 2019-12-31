//
//  YFSelectDetailViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/30.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class YFSelectDetailViewController: BaseViewController {

    private lazy var imgView: UIImageView = {
        let imgView = UIImageView.init()
        imgView.isUserInteractionEnabled = true
        
        return imgView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    private lazy var headView: YFSelectHeadView = {
        let scrollView = YFSelectHeadView()
        return scrollView
    }()

    private lazy var moreBtn: UIButton = {
        
        let moreBtn = UIButton.init(type: UIButton.ButtonType.custom)
        moreBtn.setImage(UIImage.init(named: "more"), for: .normal)
        moreBtn.setTitleColor(ColorTheme, for: .normal)
        moreBtn.addTarget(self, action: #selector(clickMore), for: .touchUpInside)
        return moreBtn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.moreBtn)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "精选回答"
        self.view.addSubview(self.scrollView)
        configLyout()
        configImageViewFrame(name: "detail2")
        
        self.scrollView.addSubview(self.headView)
        self.scrollView.contentSize = self.imgView.size
        self.scrollView.addSubview(self.imgView)

       
    }
    @objc func clickMore(){
        
        let alert = UIAlertController.init(title: "温馨提示", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        let action1 = UIAlertAction.init(title: "举报", style: .default) { (action) in
            self.report()
        }
        let action2 = UIAlertAction.init(title: "拉黑/屏蔽", style: .default) { (action) in
            self.shielding()
        }
        let action3 = UIAlertAction.init(title: "取消", style: .cancel) { (action) in
            
        }
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        self.present(alert, animated: true, completion:  nil)
        
        
    }
    func shielding() {
        let alert = UIAlertController.init(title: "拉黑/屏蔽成功", message: "● 您下次进入App将不显示此条问答\n● 点击【确定】返回上级界面", preferredStyle: UIAlertController.Style.alert)
        let action1 = UIAlertAction.init(title: "确定", style: .default) { (action) in
            self.navigationController?.popViewController()
        }


        alert.addAction(action1)
        self.present(alert, animated: true, completion:  nil)
    }
    
    
    func report() {
        let alert = UIAlertController.init(title: "举报成功", message: "●  我们会在1-3个工作日内核实并处理此条问答\n● 您下次进入App将不显示此条问答\n● 点击【确定】返回上级界面", preferredStyle: UIAlertController.Style.alert)
        let action1 = UIAlertAction.init(title: "确定", style: .default) { (action) in
            self.navigationController?.popViewController()
        }


        alert.addAction(action1)
        self.present(alert, animated: true, completion:  nil)
    }
    
    func configImageViewFrame(name:String) {
        self.imgView.image = UIImage.init(named: name)
        self.imgView.sizeToFit()
        let imgViewH = SCREEN_WIDTH * self.imgView.frame.height / self.imgView.width
        self.imgView.frame = CGRect(x: 0, y: self.headView.height, width: SCREEN_WIDTH, height: imgViewH)
    }
    func configLyout()  {
        self.scrollView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
}
