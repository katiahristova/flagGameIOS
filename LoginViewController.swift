//
//  LoginViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 5/27/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func LoginButtonClick(sender: UIButton) {
        var userEmailAddress = email.text
        userEmailAddress = userEmailAddress.lowercaseString
        
        var userPassword = password.text
        
        PFUser.logInWithUsernameInBackground(userEmailAddress, password:userPassword) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                //dispatch_async(dispatch_get_main_queue()) {
                  //  self.performSegueWithIdentifier("signInToNavigation", sender: self)
                //}
            } else {
                //self.activityIndicator.stopAnimating()
                
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)"
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
