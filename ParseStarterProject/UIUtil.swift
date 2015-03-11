//
//  UIUtil.swift
//  ParseStarterProject
//
//  Created by Pete Kim on 3/2/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation

public func notifyError(message:String!, controller: UIViewController!) {
    var alert:UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
    let cancelAction: UIAlertAction! = UIAlertAction(title: "cancel", style: .Cancel, handler:nil)
    alert.addAction(cancelAction)
    controller.presentViewController(alert, animated: true, completion: nil)
	println("asdf");
}