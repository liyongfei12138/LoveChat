//
//  FeebBook.swift
//  Margie
//
//  Created by liyongfi on 2019/12/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import WebKit

class FeebBack: UIViewController{

    var webView: WKWebView!
   
    
    override func loadView() {
        
        let conf = WKWebViewConfiguration()
        
        webView = WKWebView(frame: .zero, configuration: conf)
        webView.uiDelegate = self
        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
        view = webView
        
        self.title = "反馈意见"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        let fileURL =  Bundle.main.url(forResource: "advice", withExtension: "html" )
        webView.loadFileURL(fileURL!,allowingReadAccessTo:Bundle.main.bundleURL);
      
    }

}
extension FeebBack:WKUIDelegate{
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alert = UIAlertController.init(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction.init(title: "确定", style: .cancel) { (action) in
            
        }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        completionHandler()
    }
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
        let alert = UIAlertController.init(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction.init(title: "确定", style: .cancel) { (action) in
            
        }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
        completionHandler(true)
    }
}
