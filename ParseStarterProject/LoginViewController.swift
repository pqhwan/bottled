//
//  LoginViewController.swift
//  ParseStarterProject
//
//  Created by Pete Kim on 3/2/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class LoginController: UIViewController {
    
    @IBOutlet weak var submitButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var password_confirm: UITextField!
    
    @IBAction func login(sender: UIButton){
       
        // get input
        let title: String! = sender.titleLabel?.text
        let username = self.username.text
        let password = self.password.text
        
        if title.lowercaseString == "login" {
            let (success, message) = validateCredentialsLocally(username, password: password, passwordConfirm: nil)
            if success == false {
                notifyError(message, self)
                return
            }
       
            PFUser.logInWithUsernameInBackground(username, password: password, block: {
                (user: PFUser!, error: NSError!) -> Void in
                if user == nil {
                    // get error message
                    var message: String?
                    if error != nil {
                        message = error.localizedDescription
                    } else {
                        message = "Login Failure"
                    }
                    notifyError(message, self)
                    return
                }
                
                self.performSegueWithIdentifier("loginToMain", sender: self)
            })
            
        } else if title.lowercaseString == "signup" {
            let (success, message) = validateCredentialsLocally(username, password: password, passwordConfirm: self.password_confirm.text)
            if success == false {
                notifyError(message, self)
                return
            }
        
            // sign up with parse
            var user = PFUser()
            user.username = username
            user.password = password
            
            user.signUpInBackgroundWithBlock({
                (success: Bool!, error: NSError!) -> Void in
                if success == false {
                    notifyError(error.localizedDescription, self)
                    return
                }
                
                self.performSegueWithIdentifier("signupToProfile", sender: self)
            })
        }
    }
    
    func validateCredentialsLocally(username:String!, password:String!, passwordConfirm:String?) -> (Bool,String) {
        // null check
        if( username.isEmpty || password.isEmpty ) {
            return (false, "required fields left empty")
        }
        
        // actual contents check
        
        // confirm check
        if let confirm = passwordConfirm {
            if confirm != password {
                return (false, "passwords do not match")
            }
        }
        
        return (true, "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(
            self, selector: Selector("keyboardFrameDidChange:"), name:UIKeyboardDidChangeFrameNotification, object: nil)
        if let n = self.navigationController as UINavigationController?{
            n.navigationBar.hidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardFrameDidChange(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        self.view.layoutIfNeeded()
        
        UIView.animateWithDuration(1.0, delay: 0, options: nil, animations: {
            self.submitButton.frame = CGRectMake(
                self.submitButton.frame.origin.x,
                keyboardFrame.origin.y - self.submitButton.frame.size.height,
                self.submitButton.frame.size.width,
                self.submitButton.frame.size.height)
            }, completion: { finished in
                self.submitButtonConstraint.constant = (keyboardFrame.size.height)
                self.view.layoutIfNeeded()
        })
    }
    
}
