//
//  CanesWorkoutApi.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 4/19/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//
//
import Foundation

class CanesWorkoutApi {
    
    func loadWorkoutApi (completion: ((AnyObject) -> Void)!) {
        
        var urlString = "http://canescrossfitclub.com/api/workouts.php"
        
        let session = NSURLSession.sharedSession()
        let workoutApiUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(workoutApiUrl!){
            (data, response, error) -> Void in
        
        if error != nil {
            println(error.localizedDescription)
        } else {
        
        var error: NSError?
        
        var workoutData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as! NSArray
        
        var workouts = [WorkoutApi]()
        for workout in workoutData {
            let workout = WorkoutApi(workoutDictionary: workout as! NSDictionary)
            workouts.append(workout)
        
        }
        
         let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                dispatch_async(dispatch_get_main_queue() {
                    completion(workouts)
                }
            }
        }
    }
}