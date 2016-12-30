//
//  UIViewController+Extension.swift
//  AssociateObjects
//
//  Created by Chilli Cheng on 16/12/30.
//  Copyright © 2016年 Chilli Cheng. All rights reserved.
//

import UIKit

typealias pushCompletionClosureType = ()->()

extension UIViewController {
    private struct AssociatedKeys {
        static var failedClosureKey = "failedClosureKey"
        static var successClosureKey = "successClosureKey"
    }
    
    // 使用泛型关联闭包
    var successClosure: pushCompletionClosureType? {
        get {
            return getAssociated(associatedKey: &AssociatedKeys.successClosureKey)
        }
        set {
            setAssociated(value: newValue, associatedKey: &AssociatedKeys.successClosureKey)
        }
    }
    
    // 使用容器类关联闭包
    class closureContainer {
        var failedClosure: pushCompletionClosureType?
    }
    
    var container: closureContainer? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.failedClosureKey) as? closureContainer
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.failedClosureKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
