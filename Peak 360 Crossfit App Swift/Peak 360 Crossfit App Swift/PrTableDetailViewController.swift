//
//  PrTableDetailViewController.swift
//  Peak 360 Crossfit App Swift
//
//  Created by Kelsey Kjeldsen on 3/30/15.
//  Copyright (c) 2015 Kelsey Kjeldsen. All rights reserved.
//

import UIKit

class PrTableDetailViewController: UITableViewController {
    
    //text field for user to enter reps and weight detail notes
    @IBOutlet weak var repsNameTextField: UITextField!

    //label for list of movements
    @IBOutlet weak var movementDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
