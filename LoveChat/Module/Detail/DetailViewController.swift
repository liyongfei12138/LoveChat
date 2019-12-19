//
//  DetailViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    var detail : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

}
extension DetailViewController{
    convenience init(title:String = "") {
        self.init()
        
        self.title = title
        self.detail = title
    }
}
