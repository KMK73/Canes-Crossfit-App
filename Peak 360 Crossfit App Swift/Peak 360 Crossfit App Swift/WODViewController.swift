//
//  FirstViewController.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 3/29/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class WODViewController: UIViewController {

    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var repositories = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAsString = "http://canescrossfitclub.com/api/workouts.php"
        let url: NSURL  = NSURL(string: urlAsString)!
        let urlSession = NSURLSession.sharedSession()
        
        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                println(error.localizedDescription)
            }
            var err: NSError?
            
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSArray?
            if (err != nil) {
                println("JSON Error \(err!.localizedDescription)")
            }
            
            println(jsonResult!)
        })
        jsonQuery.resume()
    
    }

    

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
//
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//
//        var cell = tableView.dequeueReusableCellWithIdentifier("WorkoutCell", forIndexPath: indexPath) as! UITableViewCell
//        cell.textLabel?.text = repositories[indexPath.row]
//        cell.detailTextLabel?.text = repositories[indexPath.row]
//        return cell
//    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

