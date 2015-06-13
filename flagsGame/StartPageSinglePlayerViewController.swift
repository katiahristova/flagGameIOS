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
    var regions:[NSString] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var defaults = NSUserDefaults.standardUserDefaults()
        numberOfQuestions=defaults.integerForKey("numberOfQuestions")
        numberOfChoices=defaults.integerForKey("numberOfChoices")
        if let testArray : AnyObject? = defaults.objectForKey("regions") {
            if !(testArray==nil)
            { regions = testArray! as! [NSString]}
        }
        
        if (numberOfQuestions == 0)
        { numberOfQuestions=10}
        if (numberOfChoices == 0)
        {
            numberOfChoices = 4
        }
        if(regions==[])
        {
            regions =  ["Africa", "Asia", "Europe", "North_America", "Oceania", "South_America"]
        }
        
        if segue.identifier == "seguePlayWithoutMap"
        {
            println("The button was clicked")
            if let destinationVC = segue.destinationViewController as? QuizOfflineViewController{
                destinationVC.numberOfQuestions = numberOfQuestions
                destinationVC.numberOfGuesses = numberOfChoices
                destinationVC.regions = regions as! [String]
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
