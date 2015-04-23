////
////  WODDetailViewController.swift
////  Peak 360 Crossfit App Swift
////
////  Created by Kelsey Kjeldsen on 4/22/15.
////  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
////
//
//import UIKit
//
//class WODDetailViewController: UIViewController, APIControllerProtocol {
//    
//    lazy var api : APIController = APIController(delegate: self)
//    var workouts = [Workout]()
//    var workout: Workout?
//    @IBOutlet weak var detailTableView: UITableView!
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        titleLabel.text = self.workout?.name
//    
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return workouts.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("WoroutCell") as! WorkoutCell
//        let workout = workouts[indexPath.row]
//        cell.titleLabel.text = workout.title
//
//        
//        return cell
//    }
//    
//    // MARK: APIControllerProtocol
//    func didReceiveAPIResults(results: NSArray) {
//        dispatch_async(dispatch_get_main_queue(), {
//            self.workouts = Workout.workoutsWithJSON(workouts)
//            self.detailsTableView.reloadData()
//            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//        })
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var track = tracks[indexPath.row]
//        mediaPlayer.stop()
//        mediaPlayer.contentURL = NSURL(string: track.previewUrl)
//        mediaPlayer.play()
//        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? TrackCell {
//            cell.playIcon.text = "◾️"
//        }
//    }
//    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
//        UIView.animateWithDuration(0.25, animations: {
//            cell.layer.transform = CATransform3DMakeScale(1,1,1)
//        })
//    }
//    
//}