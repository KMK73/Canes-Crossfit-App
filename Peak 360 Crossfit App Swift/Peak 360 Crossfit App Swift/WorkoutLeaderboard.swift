//
//  WorkoutLeaderboard.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 3/29/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import Foundation
import UIKit

class WorkoutLeaderboard: NSObject {
    var name: String
    var wodDescription: String
    
    init(name: String, wodDescription: String) {
        self.name = name
        self.wodDescription = wodDescription
        super.init()
    }
}

