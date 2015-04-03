//
//  RegisterPageViewController.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 4/2/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonPressed(sender: AnyObject) {
        
        //all input fields to register converted to text
        let userFirstName = firstNameTextField.text;
        let userLastName = lastNameTextField.text;
        let userEmail = emailTextField.text;
        let userPassword = passwordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;

        //check for empty fields 
        if (userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty) {
            
            //display alert message
            displayAlertMessage("All fields are required");
            
            return;
        }
        
        //if user passwords do not match
        if (userPassword != userRepeatPassword){
            
            //display alert message
            displayAlertMessage("Your passwords do not match");
            
            return;
        }
        
        //connect to database and send user data
        let myURL = NSURL(string: "http://canespeak360crossfit.com/api/register.php");
        let request = NSMutableURLRequest(URL: myURL!);
        request.HTTPMethod = "POST";
        
        let postString = "first_name=\(userFirstName)&last_name=\(userLastName)&username=\(userEmail)&password=\(userPassword)";
        println("post string " + postString);
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        println(request.HTTPBody);

        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                println("error=\(error)")
                return
            }
            
            // You can print out response object
            println("response = \(response)")
            
//            // Print out response body
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
            
            // convert response sent from a server side script to a NSDictionary object:
            
            var err: NSError?
            var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error:&err) as? NSDictionary

            
            println("JSON \(myJSON)");
            
            dispatch_async(dispatch_get_main_queue(), {
                
                //display alert message with confirmation
                var myAlert = UIAlertController(title: "Alert", message:"Register", preferredStyle: UIAlertControllerStyle.Alert);
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in
                    self.dismissViewControllerAnimated(true, completion: nil);
                }
                
                myAlert.addAction(okAction);
                
                self.presentViewController(myAlert, animated: true, completion: nil);
            });
            
//            if let parseJSON = myJSON {
//                
//                //status is a function in php script user_register_ios.php that gives success or error message
//                var resultValue = parseJSON["status"] as String?
//                println("result: \(resultValue)");
//                
//                var isUserRegistered:Bool = false;
//                if(resultValue == "Success"){
//                    isUserRegistered = true;
//                }
//                
//                var messageToDisplay:String = parseJSON["message"] as String!;
//               
//                //if user is not registered display the error message from the function
//                if (!isUserRegistered){
//                   messageToDisplay = parseJSON["message"] as String!;
//                }
//                
//                dispatch_async(dispatch_get_main_queue(), {
//                    
//                //display alert message with confirmation
//                var myAlert = UIAlertController(title: "Alert", message:messageToDisplay, preferredStyle: UIAlertControllerStyle.Alert);
//                
//                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in
//                        self.dismissViewControllerAnimated(true, completion: nil);
//                    }
//                
//                myAlert.addAction(okAction);
//                
//                self.presentViewController(myAlert, animated: true, completion: nil);
//                    });
//            }
      }
            task.resume()
    }
    
}
    func displayAlertMessage(userMessage: String) {
        
        var myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);


    }

