//
//  StringExtension.swift
//  Margie
//
//  Created by liyongfi on 2019/12/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }

    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
