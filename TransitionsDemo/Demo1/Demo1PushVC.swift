//
//  Demo1TargetVC.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/13.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class Demo1PushVC: UIViewController {
    
    lazy var button:UIButton = {
        let button:UIButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 50)))
        button.setTitle("click me消失", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
        button.center = self.view.center
        button.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "转场的控制器"
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(button)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnClick(sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

