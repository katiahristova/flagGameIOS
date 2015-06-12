//
//  StartPageSinglePlayerViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/12/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class StartPageSinglePlayerViewController: UIViewController {

    var numberOfQuestions:Int = 10
    var numberOfChoices:Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("Segue triggered")
        var defaults = NSUserDefaults.standardUserDefaults()
        
        numberOfQuestions=defaults.integerForKey("numberOfQuestions")
        
        numberOfChoices=defaults.integerForKey("numberOfChoices")
        if (numberOfQuestions == 0)
        { numberOfQuestions=10}
        if (numberOfChoices == 0)
        {
            numberOfChoices = 4
        }
        
        println(String(numberOfChoices) + " : " + String (numberOfQuestions))
        
        if segue.identifier == "seguePlayWithoutMap"
        {
            println("The button was clicked")
            if let destinationVC = segue.destinationViewController as? QuizOfflineViewController{
                destinationVC.numberOfQuestions = numberOfQuestions
                destinationVC.numberOfGuesses = numberOfChoices
                destinationVC.regions = ["Africa", "Asia", "Europe", "North_America", "Oceania", "South_America"]
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
