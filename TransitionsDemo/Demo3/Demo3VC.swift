//
//  Demo3VC.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/26.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class Demo3VC: UIViewController {

    lazy var testBtn:UIButton = {
        let button:UIButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 150, height: 50)))
        button.center = self.view.center
        button.setTitle("click me 转场", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.yellow
        button.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

extension Demo3VC {
    
    func setupUI() {
        self.navigationItem.title = "present和dismiss转场"
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(testBtn)
    }
    
    @objc func btnClick(sender:UIButton) {
        let targetVC = Demo3PresentVC()
        targetVC.transitioningDelegate = self
        self.present(targetVC, animated: true, completion: nil)
    }
    
}

extension Demo3VC : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Demo3AnimationManager(type: .Present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Demo3AnimationManager(type: .Dismiss)
    }
    
    
}



