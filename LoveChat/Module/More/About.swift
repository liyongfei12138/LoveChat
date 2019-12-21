//
//  FeebBook.swift
//  Margie
//
//  Created by liyongfi on 2019/12/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import WebKit

class About: UIViewController{

    var webView: WKWebView!
   
    
    override func loadView() {
        
        let conf = WKWebViewConfiguration()
        
        webView = WKWebView(frame: .zero, configuration: conf)
        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
        view = webView
        
        self.title = "关于我们"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        let fileURL =  Bundle.main.url(forResource: "about", withExtension: "html" )
        webView.loadFileURL(fileURL!,allowingReadAccessTo:Bundle.main.bundleURL);
      
    }

}
