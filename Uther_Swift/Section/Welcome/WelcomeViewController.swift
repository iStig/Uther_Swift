//
//  WelcomeViewController.swift
//  Uther_Swift
//
//  Created by iStig on 15/9/7.
//  Copyright (c) 2015年 iStig. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    let transitionManager = WelcomeTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        //statusbar 滑入动画显示statusbar
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Slide)
        //statusbar 展示动画并设置为白字
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toViewController = segue.destinationViewController as? UIViewController
        toViewController?.transitioningDelegate = self.transitionManager
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.performSegueWithIdentifier("show_main", sender:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
