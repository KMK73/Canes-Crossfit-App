//
//  PrList.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 3/29/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import Foundation
import UIKit

class PRExercises: NSObject {
    
    //data for name, reps description, and date for table cell
    var exerciseName: String
    var exerciseDescription: String
    var exerciseDate: String
    
    init(exerciseName: String, exerciseDescription: String, exerciseDate: String) {
        self.exerciseName = exerciseName
        self.exerciseDescription = exerciseDescription
        self.exerciseDate = exerciseDate
        super.init()
    }
}
