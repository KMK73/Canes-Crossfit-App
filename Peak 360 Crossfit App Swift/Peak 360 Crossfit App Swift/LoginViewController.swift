//
//  LoginViewController.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 4/1/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidAppear (animated: Bool) {
//        self.performSegueWithIdentifier ("loginView", sender: self);
//    }
    
//    @IBAction func userLoginButtonPressed(sender: AnyObject) {
//        
//        let userEmail = userEmailTextField.text;
//        let userPassword = userPasswordTextField.text;
//    
//        if (userEmail.isEmpty || userPassword.isEmpty) {
//            return;
//        }
//        
//        
//        //send user data to server to check if user is already registered
//        let myURL = NSURL(string: "http://canespeak360crossfit.com/api/checkLogin.php");
//        let request = NSMutableURLRequest(URL: myURL!);
//        request.HTTPMethod = "POST";
//        
//        let postString = ("username=\(userEmail)&password=\(userPassword)");
//        
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
//        
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//            data, response, error in
//            
//            if error != nil
//            {
//                println("error=\(error)")
//                return
//            }
//
//            
//            // Print out response body
//            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
//            println("responseString = \(responseString)")
//            
//            // convert response sent from a server side script to a NSDictionary object:
//            
//            var err: NSError?
//            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &err) as? NSDictionary
//
//            if let parseJSON = json {
//                var resultValue: String = parseJSON["status"] as String!;
//                println("result: \(resultValue)");
//    
//                if (resultValue=="Success") {
//    
//                    //login successful
//                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
//                    NSUserDefaults.standardUserDefaults().synchronize();
//    
//                    self.dismissViewControllerAnimated(true, completion: nil);
//                }
//            }
//        }
//        task.resume();

    }

