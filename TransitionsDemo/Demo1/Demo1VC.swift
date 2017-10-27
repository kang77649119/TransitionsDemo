//
//  Demo1VC.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/13.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class Demo1VC: UIViewController {

    lazy var button:UIButton = {
        let button:UIButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 50)))
        button.center = self.view.center
        button.setTitle("click me转场", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
        button.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        // 设置导航控制器的代理为当前控制器，在下面需要实现代理方法
        self.navigationController?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "push和pop转场"
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        
    }
    
    @objc func btnClick(sender:UIButton) {
        let targetVC = Demo1PushVC()
        self.navigationController?.pushViewController(targetVC, animated: true)
    }

}

extension Demo1VC : UINavigationControllerDelegate {

    // 实现代理方法，返回处理动画对象(该对象必须继承转场协议)
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return operation == .push ? Demo1AnimationManager.init(type: .Push) : Demo1AnimationManager.init(type: .Pop)
    }
    
}

