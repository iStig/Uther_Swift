//
//  WelcomeTransitionManager.swift
//  Uther_Swift
//
//  Created by iStig on 15/9/7.
//  Copyright (c) 2015年 iStig. All rights reserved.
//

import UIKit

class WelcomeTransitionManager: NSObject,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate {
    
    // MARK: UIViewControllerAnimatedTransitioning
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView()
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!

        container.addSubview(toView)
        container.addSubview(fromView)
        
        let fromAvatar = fromView.viewWithTag(1001)!
        let toAvatar = toView.viewWithTag(1002)!
        
        let snapshotAvatar = fromAvatar.snapshotViewAfterScreenUpdates(true)
        snapshotAvatar.frame = fromAvatar.frame
        container.addSubview(snapshotAvatar)
   
        fromAvatar.alpha = 0
        toAvatar.alpha = 0
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            fromView.alpha = 0
            snapshotAvatar.frame = toAvatar.frame //将快照的头像位置从中间移动到左上角
            },
            completion: { finished in
                toAvatar.alpha = 1
                
                snapshotAvatar.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        )
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}
