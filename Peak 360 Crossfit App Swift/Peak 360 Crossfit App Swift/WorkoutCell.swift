//
//  Album.swift
//  iTunesPreviewTutorial
//
//  Created by Jameson Quave on 4/16/15.
//  Copyright (c) 2015 JQ Software LLC. All rights reserved.
//

import Foundation

struct Workout {
    let name: String
    let date: String
    let workout_description: String
    
    
    init(name: String, date: String, workout_description: String) {
        self.name = name
        self.date = date
        self.workout_description = workout_description
//        self.largeImageURL = largeImageURL
//        self.itemURL = itemURL
//        self.artistURL = artistURL
//        self.collectionId = collectionId
    }
    
    static func workoutsWithJSON(results: NSArray) -> [Workout] {
        // Create an empty array of Workouts to append to from this list
        var workouts = [Workout]()
        
        // Store the results in our table data array
        if results.count>0 {
            
            // Sometimes iTunes returns a collection, not a track, so we check both for the 'name'
            for result in results {
                
                var name = result["name"] as? String
                var date = result["Date"] as? String
                var workout_description = result["Description"] as? String

                    var newWorkout = Workout(name: name!,
                        date: date!,
                        workout_description: workout_description!)
                    workouts.append(newWorkout)
                }
            }
        return workouts
        
        }
    }
    
