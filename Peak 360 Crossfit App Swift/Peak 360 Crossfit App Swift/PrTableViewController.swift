//
//  PrTableViewController.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 3/29/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class PrTableViewController: UITableViewController {
    
    //variable exercises type array set to the constant of PRData with the hardcoded workout data from the PRExercises class
    var exercises: [PRExercises] = PRData
    
    @IBAction func cancelToPrTableViewController(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func savePrTableDetail(segue:UIStoryboardSegue) {
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //get the amount of rows from the PRData sample class and return the count
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PRData.count
    }
    
    //cell data for labels, description, and date
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell { //return a table view cell
            
            println("Made it to Prtable function")
            
            
            let cell = tableView.dequeueReusableCellWithIdentifier("PRTableCell", forIndexPath: indexPath) as! PrTableCell
            let exercise = exercises[indexPath.row] as PRExercises
            cell.exerciseNameLabel.text = exercise.exerciseName
            cell.exerciseDescriptionLabel.text = exercise.exerciseDescription
            cell.exerciseDateLabel.text = exercise.exerciseDate
            return cell
    }
}






