//
//  NSObject+Extension.swift
//  AssociateObjects
//
//  Created by Chilli Cheng on 16/12/30.
//  Copyright © 2016年 Chilli Cheng. All rights reserved.
//

import Foundation

extension NSObject {
    
    func setAssociated<T>(value: T, associatedKey: UnsafeRawPointer, policy: objc_AssociationPolicy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) -> Void {
        objc_setAssociatedObject(self, associatedKey, value, policy)
    }
    
    func getAssociated<T>(associatedKey: UnsafeRawPointer) -> T? {
        let value = objc_getAssociatedObject(self, associatedKey) as? T
        return value;
    }
    
}
