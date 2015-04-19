//
//  LeaderboardTableViewController.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 3/29/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class LeaderboardTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    //variable workouts type array set to the constant of workoutData with the hardcoded workout data
    var workouts: [WorkoutLeaderboard] = workoutData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("WorkoutCell", forIndexPath: indexPath)
                as! UITableViewCell
            
            let workout = workouts[indexPath.row] as WorkoutLeaderboard
            cell.textLabel?.text = workout.name
            cell.detailTextLabel?.text = workout.wodDescription
            return cell
    }
}
