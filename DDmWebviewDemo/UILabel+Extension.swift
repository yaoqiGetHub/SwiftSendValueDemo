//
//  UILabel+Extension.swift
//  DDmWebviewDemo
//
//  Created by yaoqi on 17/2/7.
//  Copyright © 2017年 yaoqi. All rights reserved.
//

import UIKit


// MARK: - 延展测试
extension UIView {
    
    var height : CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue //这里要成这样
        }
    }
    
    /*
     测试
     - Returns: 最右端的坐标
     */
    func rightViewX() -> CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }
    
}
