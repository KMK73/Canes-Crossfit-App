//
//  RegisterVC.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 4/3/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class TestRegisterVC: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var userTypeButton: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func gotoLogin(sender : UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func registerTapped(sender : UIButton) {
        
        var first_name = firstNameTextField.text as NSString
        var last_name = lastNameTextField.text as NSString
        
        var username:NSString = emailTextField.text as NSString
        var password:NSString = passwordTextField.text as NSString
        var confirm_password:NSString = repeatPasswordTextField.text as NSString
        
        //get text value of Athlete or Coach
        var user_type:NSString = userTypeButton.titleForSegmentAtIndex(userTypeButton.selectedSegmentIndex)!;
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else if ( !password.isEqual(confirm_password) ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Passwords doesn't Match"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else {
            
            var post:NSString = "first_name=\(first_name)&last_name=\(last_name)&username=\(username)&password=\(password)&c_password=\(confirm_password)&user_type=\(user_type)";
            
            NSLog("PostData: %@",post);
            
            var url:NSURL = NSURL(string: "http://canescrossfitclub.com/api/register_ios.php")!
            
            var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            
            var postLength:NSString = String( postData.length )
            
            var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.HTTPBody = postData
            request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            
            var reponseError: NSError?
            var response: NSURLResponse?
            
            var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
            
            if ( urlData != nil ) {
                let res = response as! NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
                
                if (res.statusCode >= 200 && res.statusCode < 300) {
                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    NSLog("Response ==> %@", responseData);
                    
                    var error: NSError?
                    
                    //NEW CODE FROM REGISTER VC PAGE ORIGINAL =====================================
                    
                    //display alert message with confirmation
                    var myAlert = UIAlertController(title: "Alert", message:"You have registered", preferredStyle: UIAlertControllerStyle.Alert);
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in
                        self.dismissViewControllerAnimated(true, completion: nil);
                    }
                    
                    myAlert.addAction(okAction);
                    
                    self.presentViewController(myAlert, animated: true, completion: nil);
                }
                else {
                    var error_msg = NSString()
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign Up Failed!"
                    alertView.message = error_msg as String
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    
                }
            }
            
            //                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
            //
            //                    let success:NSInteger = responseData.valueForKey("success") as NSInteger
            //
            ////                    [jsonData[@"success"] integerValue];
            //
            //                    NSLog("Success: %ld", success);
            //
            //                    if(success == 1)
            //                    {
            //                        NSLog("Sign Up SUCCESS");
            //                        self.dismissViewControllerAnimated(true, completion: nil)
            //                    } else {
            //                        var error_msg:NSString
            //
            //                        if jsonData["error_message"] as? NSString != nil {
            //                            error_msg = jsonData["error_message"] as NSString
            //                        } else {
            //                            error_msg = "Unknown Error"
            //                        }
            //                        var alertView:UIAlertView = UIAlertView()
            //                        alertView.title = "Sign Up Failed!"
            //                        alertView.message = error_msg
            //                        alertView.delegate = self
            //                        alertView.addButtonWithTitle("OK")
            //                        alertView.show()
            //
            //                    }
            //
            //                } else {
            //                    var alertView:UIAlertView = UIAlertView()
            //                    alertView.title = "Sign Up Failed!"
            //                    alertView.message = "Connection Failed"
            //                    alertView.delegate = self
            //                    alertView.addButtonWithTitle("OK")
            //                    alertView.show()
            //                }
            //            }  else {
            //                var alertView:UIAlertView = UIAlertView()
            //                alertView.title = "Sign in Failed!"
            //                alertView.message = "Connection Failure"
            //                if let error = reponseError {
            //                    alertView.message = (error.localizedDescription)
            //                }
            //                alertView.delegate = self
            //                alertView.addButtonWithTitle("OK")
            //                alertView.show()
            //            }
            //        }
            //        
            //    }
            
            func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
                textField.resignFirstResponder()
                return true
            }
        }
    }
}
