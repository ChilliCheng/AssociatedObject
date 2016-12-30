//
//  UIView+Extension.swift
//  AssociateObjects
//
//  Created by Chilli Cheng on 16/12/30.
//  Copyright © 2016年 Chilli Cheng. All rights reserved.
//

import UIKit

typealias closureBlock = ()->()

extension UIView {
    // 嵌套结构体
    private struct AssociatedKeys {
        static var isShowKey = "isShowKey"
        static var displayNameKey = "displayNameKey"
        static var widthKey = "widthKey"
    }
    
    // Bool 类型
    var isShow: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.isShowKey) as! Bool
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isShowKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // String 类型
    var displayName: String? {
/*
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.displayNameKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.displayNameKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
 */
        get  {
            return getAssociated(associatedKey: &AssociatedKeys.displayNameKey)
        }
        set {
            setAssociated(value: newValue, associatedKey: &AssociatedKeys.displayNameKey)
        }
    }
    
    // Float 类型
    var width: Float {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.widthKey) as! Float
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.widthKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
