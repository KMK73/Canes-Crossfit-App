//
//  ProfileViewController.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 3/29/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutTapped(sender : UIButton) {
        
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("logoutToLoginView", sender: self)
    }
    
}

