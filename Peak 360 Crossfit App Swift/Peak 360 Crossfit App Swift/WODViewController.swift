//
//  WODViewController.swift
//  iTunesPreviewTutorial
//
//  Created by Jameson Quave on 4/16/15.
//  Copyright (c) 2015 JQ Software LLC. All rights reserved.
//

import UIKit

class WODViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol  {
    var workouts = [Workout]()
    var api: APIController!
    let kCellIdentifier: String = "WorkoutCell"
    var imageCache = [String:UIImage]()
    @IBOutlet weak var workoutsTableView: UITableView!

    @IBOutlet weak var canesLogoImage: UIImageView!

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api = APIController(delegate: self)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        api.get("http://canescrossfitclub.com/api/workouts_ios.php") //just the latest entry workouts
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as! UITableViewCell
        let workout = self.workouts[indexPath.row]
        
        // Get the formatted string for display in the subtitle
        cell.detailTextLabel?.text = workout.workout_description
        
        // Update the textLabel text to use the title from the workout        
        cell.textLabel?.text = workout.name
        
        
        //cant get workout label for all cells
        //workoutDateLabel?.text = workout.date
        
        return cell
    }
    
    func didReceiveAPIResults(results: NSArray) {
        dispatch_async(dispatch_get_main_queue(), {
            self.workouts = Workout.workoutsWithJSON(results)
            self.workoutsTableView!.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
//        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//            if let detailsViewController: WODDetailViewController = segue.destinationViewController as? WODDetailViewController {
//                var workoutIndex = workoutsTableView!.indexPathForSelectedRow()!.row
//                var selectedWorkout = self.workouts[workoutIndex]
//                detailsViewController.workout = selectedWorkout
//            }
//        }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
    }
    
}

