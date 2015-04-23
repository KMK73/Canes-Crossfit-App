//
//  APIController.swift
//  iTunesPreviewTutorial
//
//  Created by Jameson Quave on 4/16/15.
//  Copyright (c) 2015 JQ Software LLC. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSArray)
}

class APIController {
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol) {
        self.delegate = delegate
    }
    
    func get(path: String) {
//        let urlPath =
        let url: NSURL  = NSURL(string: path)!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary {
                if(err != nil) {
                    // If there is an error parsing JSON, print it to the console
                    println("JSON Error \(err!.localizedDescription)")
                }
                else {
                    println("no errors")
                }
                if let results: NSArray = jsonResult["workouts"] as? NSArray {
                    println("Heyo")
                    self.delegate.didReceiveAPIResults(results)
                }
                else {
                    
                    println("results not an array?")
                }
            }
            else {
                println("No json result?")
            }
            
        })
        
        // The task is just an object with all these properties set
        // In order to actually make the web request, we need to "resume"
        task.resume()
    }
    

    
}