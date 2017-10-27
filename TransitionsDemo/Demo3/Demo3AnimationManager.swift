//
//  Demo3Animation.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/26.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class Demo3AnimationManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum AnimationType {
        case Present
        case Dismiss
    }
    
    var animationType:AnimationType?
    
    init(type:AnimationType? = nil) {
        self.animationType = type
    }
    
    let duration = 0.8
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if self.animationType == AnimationType.Present {
            presentAnimation(transitionContext)
        } else {
            disMissAnimation(transitionContext)
        }
        
    }
    
    // present动画
    private func presentAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        // 1.获取容器视图
        let containerView = transitionContext.containerView
        // 2.获取目标视图
        let toView = transitionContext.view(forKey: .to)!
        // 把目标界面向左偏移一个屏幕宽度
        toView.frame = UIScreen.main.bounds.offsetBy(dx: -UIScreen.main.bounds.width, dy: 0)
        // 3.添加视图到容器视图
        containerView.addSubview(toView)
        
        // 4.做动画
        let animationDuration = transitionDuration(using: transitionContext)
        // 让动画有弹簧效果
        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            toView.frame = UIScreen.main.bounds
        }) { (isFinished) in
            transitionContext.completeTransition(true)
        }
    }
    
    // dissmiss动画
    private func disMissAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        
        // 1.获取容器视图
        let containerView = transitionContext.containerView
        // 2.获取目标视图
        let toView = transitionContext.view(forKey: .to)!
        // 3.添加视图到容器视图
        containerView.addSubview(toView)
        
        let fromView = transitionContext.view(forKey: .from)!
        containerView.addSubview(fromView)
        
        // 4.做动画
        let animationDuration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            fromView.frame.origin.x += 20
        }) { (isFinished) in
            fromView.frame.origin.x -= 20
            UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
                fromView.frame.origin.x = -UIScreen.main.bounds.width
            }) { (isFinished) in
                transitionContext.completeTransition(true)
            }
        }
        
        
        
    }
    
}
