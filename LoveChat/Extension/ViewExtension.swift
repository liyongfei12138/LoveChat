//
//  ViewExtension.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/21.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit


extension UIView {

    func addBlurEffect(){
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = self.bounds
        blurView.layer.masksToBounds = true
        self.addSubview(blurView)
    }
}
