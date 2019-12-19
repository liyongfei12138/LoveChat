//
//  TableViewCellReusable.swift
//  Pretty
//
//  Created by Mac on 2019/10/29.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static func reusableCell(tableView: UITableView) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: String.gl_fromClass(Class: self.self))
        
        if cell == nil {
            
            let path: String? = Bundle.main.path(forResource: String.gl_fromClass(Class: self.self), ofType: "nib")
            
            if path != nil && path!.count > 0 {
                
                cell = Bundle.main.loadNibNamed(String.gl_fromClass(Class: self.self), owner: nil, options: nil)?.first as? UITableViewCell
                cell?.setValue(String.gl_fromClass(Class: self.self), forKey: "reuseIdentifier")
            }else {
                
                cell = self.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: String.gl_fromClass(Class: self.self))
            }
        }
        return cell!
    }
    
}
