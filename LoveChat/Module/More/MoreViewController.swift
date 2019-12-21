//
//  MoreViewController.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit
import StoreKit
class MoreViewController: BaseViewController {

    lazy var listView: MeSettingTableView = {
        let listView = MeSettingTableView.init()
        listView.clickDelegate = self
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(self.listView)
        configLayou()
        
    }
    func configLayou() {
        self.listView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    func selectImage() {
        let alertController=UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let cancel=UIAlertAction(title:"取消", style: .cancel, handler: nil)
        let takingPictures=UIAlertAction(title:"拍照", style: .default)
        {
            action in
            self.goCamera()
            
        }
        let localPhoto=UIAlertAction(title:"本地图片", style: .default)
        {
            action in
            self.goImage()
            
        }
        alertController.addAction(cancel)
        alertController.addAction(takingPictures)
        alertController.addAction(localPhoto)
        self.present(alertController, animated:true, completion:nil)
    }
    func goCamera(){
                    
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let  cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = .camera
            //在需要的地方present出来
            self.present(cameraPicker, animated: true, completion: nil)
        } else {
            
            print("不支持拍照")
            
        }

    }
    func goImage(){

        let photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        photoPicker.sourceType = .photoLibrary
        //在需要的地方present出来
        self.present(photoPicker, animated: true, completion: nil)
        
    }
    
}
extension MoreViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        
            let image : UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage

            SaveModel.saveHeadImg(image: image)
            self.listView.configImage()
            self.dismiss(animated: true, completion: nil)
    }
}
extension MoreViewController : FR_ClickDelegate{
    func fr_clickViewDelegte(type: MoreRowType) {
        switch type {
            case .headImg:
                self.selectImage()
            break
            case .vip:
            break
            case .reback_vip:
            break
            case .contact:
                let phone = "telprompt://" + "15763372344"
                UIApplication.shared.openURL(URL(string: phone)!)
            break
            case .cache:
                let alert = UIAlertController.init(title: "", message: "清除缓存成功" , preferredStyle: UIAlertController.Style.alert)
                
                let action = UIAlertAction.init(title: "确定", style: .cancel) { (action) in
                    
                }
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
                
            break
            case .praise:
                if #available(iOS 10.3, *) {
                    SKStoreReviewController.requestReview()
                } else {
                    // Fallback on earlier versions
                }
                
            break
            case .about:
            break
            case .feedback:
                let feedVC = FeebBack()
                self.navigationController?.pushViewController(feedVC)
            break
            
        default:
        break
        }
    }
}
