//
//  ViewController.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/13.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 转场1
    @IBAction func goDemo1(_ sender: Any) {
        self.navigationController?.pushViewController(Demo1VC(), animated: true)
    }
    
    // 转场2
    @IBAction func goDemo2(_ sender: Any) {
        self.navigationController?.pushViewController(Demo2VC(), animated: true)
    }
    
    // 转场3
    @IBAction func goDemo3(_ sender: Any) {
        self.navigationController!.pushViewController(Demo3VC(), animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

