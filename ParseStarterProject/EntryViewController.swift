//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class EntryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let n = self.navigationController as UINavigationController?{
            n.navigationBar.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

