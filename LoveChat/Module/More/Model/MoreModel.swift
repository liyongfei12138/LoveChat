//
//  MoreModel.swift
//  LoveChat
//
//  Created by liyongfi on 2019/12/19.
//  Copyright © 2019 liyongfi. All rights reserved.
//

import UIKit

struct MoreModel {
    
    static func getMoreListData()->[MoreBaseModel]{
        
        let model1 = MoreBaseModel.init(title: "解锁VIP", type: .vip, icon: "more_vip" ,detail:"")
        let model2 = MoreBaseModel.init(title: "恢复VIP会员", type: .reback_vip, icon: "more_reback" ,detail:"")
        let model3 = MoreBaseModel.init(title: "清除缓存", type: .cache, icon: "more_cache" ,detail:"")
        let model4 = MoreBaseModel.init(title: "联系客服", type: .contact, icon: "more_kefu" ,detail:"")
        let model5 = MoreBaseModel.init(title: "给个好评", type: .praise, icon: "more_like" ,detail:"")
        let model6 = MoreBaseModel.init(title: "关于我们", type: .about, icon: "more_about" ,detail:"")
        let model7 = MoreBaseModel.init(title: "反馈", type: .feedback, icon: "more_fankui" ,detail:"")
        
        
        
        return [model1,model2,model3,model4,model5,model6,model7]
    }
}
public  enum MoreRowType: Int  {
    case vip
    case reback_vip
    case cache
    case contact
    case praise
    case about
    case headImg
    case feedback
    case other
}
public struct MoreBaseModel {
    var title : String?
    var type : MoreRowType?
    var icon :String?
    var detail :String?
    
    
    init( title: String, type: MoreRowType = .other, icon:String? = "",detail:String? = "") {
        self.title = title
        self.type = type
        self.icon = icon
        self.detail = detail
    }
}
