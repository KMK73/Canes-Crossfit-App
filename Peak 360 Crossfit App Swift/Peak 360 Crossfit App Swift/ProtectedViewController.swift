//
//  ViewController.swift
//  Peak 360 Crossfit App Swift
//
//
//
//  Created by Kelsey Kjeldsen on 4/1/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class ProtectedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {

        
        //if login was success send to tab bar view controller main screen
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if(prefs.integerForKey("ISLOGGEDIN") == 1) {
            self.performSegueWithIdentifier("LoggedIn", sender: self);
        } else {        //if it was not a success send to login page
            self.performSegueWithIdentifier("loginView", sender: self);
        }
    }


}

