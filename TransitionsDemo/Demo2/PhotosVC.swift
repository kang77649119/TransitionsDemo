//
//  PhotosVC.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/15.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class PhotosVC: UIViewController {
    
    var image:UIImage?

    var edgePan:UIScreenEdgePanGestureRecognizer!
    
    private var percentDrivenTransition: UIPercentDrivenInteractiveTransition?
    
    lazy var largeImageView:UIImageView = {
        let largeImageView:UIImageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 300)))
        largeImageView.center = self.view.center
        largeImageView.contentMode = .scaleAspectFill
        return largeImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

extension PhotosVC {
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(largeImageView)
        self.title = "详情界面"
        
        self.navigationController?.delegate = self
        
        // 添加手势
        let ges = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissGes(sender:)))
        self.view.addGestureRecognizer(ges)
    }
    
    @objc func dismissGes(sender:UISwipeGestureRecognizer) {
        print(#function)
        self.navigationController?.popViewController(animated: true)

    }
    
}

extension PhotosVC : UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.pop {
            return Demo2AnimationManager(type: .pop)
        } else {
            return nil
        }
    }
    
}
