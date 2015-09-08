//
//  HistoryTransitionManager.swift
//  Uther_Swift
//
//  Created by iStig on 15/9/8.
//  Copyright (c) 2015年 iStig. All rights reserved.
//

import UIKit

class HistoryTransitionManager: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    var isPresenting = false
   
    //MARK: UIViewControllerAnimatedTransitioning
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        if isPresenting {
            container.addSubview(fromView)
            container.addSubview(toView)
        } else {
            container.addSubview(toView)
            container.addSubview(fromView)
        }
        
        let fromAvatar = isPresenting ? fromView.viewWithTag(1002)! : fromView.viewWithTag(1003)!
        let toAvatar = isPresenting ? toView.viewWithTag(1003)! : toView.viewWithTag(1002)!
        
        let snapshotAvatar = fromAvatar.snapshotViewAfterScreenUpdates(true)
        snapshotAvatar.frame = fromAvatar.frame
        container.addSubview(snapshotAvatar)
        
        let offsetY = fabs(fromAvatar.frame.size.height - toAvatar.frame.size.height)
        let offScreenBottom = CGAffineTransformMakeTranslation(0, offsetY)
//        let offScreenTop = CGAffineTransformMakeTranslation(0, -offsetY)
        
        if isPresenting {
            toView.transform = offScreenBottom
            toView.alpha = 0
        }
        
        fromAvatar.alpha = 0
        toAvatar.alpha = 0
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            snapshotAvatar.frame = toAvatar.frame
            toView.alpha = 1
            toView.transform = CGAffineTransformIdentity
          
            if !self.isPresenting {
                fromView.alpha = 0
                fromView.transform = offScreenBottom;
            }
            
            }, completion: { finished in
                toAvatar.alpha = 1
                fromView.transform = CGAffineTransformIdentity
                snapshotAvatar.removeFromSuperview()
        
            transitionContext.completeTransition(true)
        })
    }
    
    //MARK: UIViewControllerTransitioningDelegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    
}
