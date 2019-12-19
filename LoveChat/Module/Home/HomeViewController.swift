//
//  HomeViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    private lazy var moreBtn: UIButton = {
        let moreBtn = UIButton.init(type: .custom)
        moreBtn.setImage(UIImage(named: "home_more"), for: .normal)
        moreBtn.addTarget(self, action: #selector(clickMoreBtn), for: .touchUpInside)
        return moreBtn
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.moreBtn)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "恋爱话术"
    }
    
    @objc func clickMoreBtn(){
        let moreVC = MoreViewController()
        self.navigationController?.pushViewController(moreVC, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let detailvc = DetailViewController.init(title:"恋爱话术")
        self.navigationController?.pushViewController(detailvc, animated: true)
        
    }

}
