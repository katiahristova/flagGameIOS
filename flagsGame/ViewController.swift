//
//  ViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 5/27/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let permissions = ["public_profile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fbLoginClick(sender: UIButton) {
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
                } else {
                    println("User logged in through Facebook!")
                }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
            }
        }
    }

}

