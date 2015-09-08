//
//  UtherDisplayViewController.swift
//  Uther_Swift
//
//  Created by iStig on 15/9/8.
//  Copyright (c) 2015年 iStig. All rights reserved.
//

import UIKit

class UtherDisplayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func avatarTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("show_history", sender: nil)
    }
    
    let transitionManager = HistoryTransitionManager()
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show_history" {
        let toViewController = segue.destinationViewController as? UIViewController
            toViewController?.transitioningDelegate = self.transitionManager
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
