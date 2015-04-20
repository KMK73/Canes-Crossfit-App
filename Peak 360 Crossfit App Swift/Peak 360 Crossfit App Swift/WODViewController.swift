//
//  FirstViewController.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 3/29/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class WODViewController: UIViewController{
    
    @IBOutlet weak var WorkoutTitleLabel: UILabel!
    @IBOutlet weak var WorkoutDescriptionLabel: UILabel!
    @IBOutlet weak var WodTableView: UITableView!

    var workouts: [WorkoutApi]!
    var cellHeight: CGFloat = 240
    
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
            
            self.workouts = [WorkoutApi]()
            let api = WorkoutApi(workoutDictionary: NSDictionary);)
            api.loadWorkoutApi(nil)
        })
        jsonQuery.resume()
        
        
    }
    
    func didLoadWorkouts (workouts: WorkoutApi[]({
        self.workouts = workouts
        //do not know what to put here instead of collectionView
        UITableView.reloadData()
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("WorkoutCell", forIndexPath: indexPath) as! UITableViewCell
        
        let workout = workouts[indexPath.row]
        cell.workoutTitleLabel!.text = workout.wod_name
        cell.workoutDescriptionLabel!.text= workout.wod_description
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
