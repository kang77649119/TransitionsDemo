//
//  Demo1AnimationManager.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/26.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class Demo1AnimationManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum AnimationType {
        case Push
        case Pop
    }
    
    var animationType:AnimationType?
    
    init(type:AnimationType) {
        self.animationType = type
    }
    
    // 转场动画执行所需的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    // 动画执行的地方
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 判断导航栏是push 还是 pop，执行对应的动画
        if self.animationType == .Push {
            pushAnimation(transitionContext)
        } else {
            popAnimation(transitionContext)
        }
    }
    
}

extension Demo1AnimationManager {
    
    // push 动画
    private func pushAnimation(_ transitionContext: UIViewControllerContextTransitioning) {

        // 执行动画用到的容器
        let containView = transitionContext.containerView
        
        // to 代表目标，在本例中代表跳转后需要显示的视图
        let toView = transitionContext.view(forKey: .to)!
        toView.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        
        // 将目标视图添加到容器中
        containView.addSubview(toView)
        
        // 执行动画
        UIView.animate(withDuration: 0.5, animations: {
            toView.backgroundColor = UIColor.white
        }) { (isFinished) in
            // 表示动画完成后，跳转过程结束
            transitionContext.completeTransition(true)
        }
        
    }
    
    // pop 动画
    private func popAnimation(_ transitionContext: UIViewControllerContextTransitioning) {
        
        let containView = transitionContext.containerView
        // 当前是pop，那么from 就表示当前显示的界面
        let fromView = transitionContext.view(forKey: .from)!
        // to 就表示要返回的界面，这里要跟push分清楚
        let toView = transitionContext.view(forKey: .to)!
        toView.alpha = 0
        containView.addSubview(toView)
        UIView.animate(withDuration: 0.5, animations: {
            fromView.backgroundColor = UIColor.yellow.withAlphaComponent(0.7)
        }) { (isFinished) in
            toView.alpha = 1
            fromView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
        
    }
    
}
