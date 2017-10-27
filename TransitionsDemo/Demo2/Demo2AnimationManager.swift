//
//  Demo2Animation.swift
//  TransitionsDemo
//
//  Created by 也许、 on 2017/10/15.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class Demo2AnimationManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum AnimationType {
        case push
        case pop
    }
    
    // 跳转方式
    var type:AnimationType?
    
    // 查看的图片
    var targetImageView:UIImageView?
    
    init(type:AnimationType){
        self.type = type
    }
    
    // 动画执行时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    // 动画逻辑
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if type == AnimationType.push {
            pushAnimation(transitionContext)
        } else {
            popAnimation(transitionContext: transitionContext)
        }
    }
    
    func pushAnimation(_ transitionContext:UIViewControllerContextTransitioning) {
        
        // 跳转前的控制器
        let fromVC = transitionContext.viewController(forKey: .from) as! Demo2VC
        
        // 跳转后的控制器
        let toVC = transitionContext.viewController(forKey: .to) as! PhotosVC
        
        // 动画容器
        let containerView = transitionContext.containerView
        
        // 把点击的cell中的图片，生成一张截图，这样执行动画时，操作这张截图就可以了
        let snapshotView = fromVC.selectedCell!.contentImageView.snapshotView(afterScreenUpdates: false)!
        // convert方法 用于获取位置及大小，如果你不会，需要参考下面的文章，动手写一写
        // http://www.jianshu.com/p/103d6aac84b4
        // http://blog.csdn.net/xuhuan_wh/article/details/8486337/
        // 把cell中的图片的位置和大小，转换成相对于容器中的位置，赋值给截图view(这样执行动画时才能看到位置的变化)
        snapshotView.frame = containerView.convert(fromVC.selectedCell!.contentImageView.frame, from: fromVC.selectedCell!)
        // 截图已经有了，就可以把cell中的图片隐藏了，执行动画时，显得截图就是cell中的图片，并执行的动画（体验性好一些）
        fromVC.selectedCell!.contentImageView.isHidden = true
      
        // 设置目标视图，先隐藏，执行完动画后再显示
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.view.alpha = 0
    
        containerView.addSubview(toVC.view)
        
        // 截图要加在目标视图上面，因为截图在执行完动画后，会隐藏掉，目标视图设置为显示
        containerView.addSubview(snapshotView)
        
        // 执行动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            // 截图的位置在上面已经设置过了，就是点击cell的位置
            // 这里把目标视图的imageView的位置赋值给截图，才会出现动画的移动
            snapshotView.frame = toVC.largeImageView.frame
            // 目标视图设置为显示
            toVC.view.alpha = 1
        }) { (finished) in
            // 动画执行完，不需要的元素就可以清理一下了
            // 显示点击的cell
            fromVC.selectedCell!.isHidden = false
            // 显示图片
            toVC.largeImageView.image = toVC.image
            // 截图可以移除了
            snapshotView.removeFromSuperview()
            // 把剩下的操作交给系统，转场结束
            transitionContext.completeTransition(true)
        }
        
    }
    
    // POP动画
    func popAnimation(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: .from) as! PhotosVC
        let toVC = transitionContext.viewController(forKey: .to) as! Demo2VC
        let containerView = transitionContext.containerView
        
        let snapshotView = fromVC.largeImageView.snapshotView(afterScreenUpdates: false)!
        snapshotView.frame = containerView.convert(fromVC.largeImageView.frame, from: fromVC.view)
        fromVC.largeImageView.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.selectedCell!.contentImageView.isHidden = true
        
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        containerView.addSubview(snapshotView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            snapshotView.frame = containerView.convert(toVC.selectedCell!.contentImageView.frame, from: toVC.selectedCell)
            fromVC.view.alpha = 0
            
        }) { (isFinished) in
            
            toVC.selectedCell?.contentImageView.isHidden = false
            snapshotView.removeFromSuperview()
            fromVC.largeImageView.isHidden = false
            transitionContext.completeTransition(true)
            
        }
        
    }
    
    
}
