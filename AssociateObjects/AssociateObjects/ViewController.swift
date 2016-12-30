//
//  ViewController.swift
//  AssociateObjects
//
//  Created by Chilli Cheng on 16/12/30.
//  Copyright © 2016年 Chilli Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pushBtnClicked(_ sender: UIButton) {
        
        let subVc = UIViewController()
        subVc.view.backgroundColor = UIColor.gray

        // 使用容器类的方式关联闭包
        let failedClosure: pushCompletionClosureType = {
            print("failed closure executed ===")
        }
        
        let container = UIViewController.closureContainer()
        container.failedClosure = failedClosure
        subVc.container = container;
        
        // 使用泛型类型关联闭包属性
        let successClosure: pushCompletionClosureType = {
            print("=== success closure executed")
        }
        subVc.successClosure = successClosure
        
        navigationController?.pushViewController(subVc, animated: true)
        
        subVc.container?.failedClosure?()
        subVc.successClosure?()
    }

}

