//
//  WorkoutApi.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 4/18/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import Foundation
import UIKit

class WorkoutApi {
    
    var wod_id: Int?
    var wod_name: String?
    var wod_type: String?
    var wod_description: String?
    var wod_date: Int?
    
    init(workoutDictionary: NSDictionary) {
        //have to initialize default values for the JSON data but making the optionals by "?" will initialize
        self.wod_id = workoutDictionary["id"] as? Int
        
        self.wod_name = getStringFromJSON(workoutDictionary, key: "name")
        self.wod_type = getStringFromJSON(workoutDictionary, key: "type")
        
        let desc = getStringFromJSON(workoutDictionary, key: "description")
        self.wod_description = desc
        
    }
    
    
    func getStringFromJSON (workoutDictionary: NSDictionary, key: String) -> String{
        
        let info : AnyObject? = workoutDictionary[key]
        
        if let info = workoutDictionary[key] as? String {
            return info
        }
        return ""
    }
}