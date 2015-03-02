//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        
        
        // test saving object
        /*
        var testObj: PFObject = PFObject(className: "testObject")
        testObj["foo"] = "bar"
        testObj.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if success {
                println("success")
            } else {
                println("failure")
            }
        }
        println("created and saved object")
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

