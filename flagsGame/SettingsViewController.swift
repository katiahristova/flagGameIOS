//
//  SettingsViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/12/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var chooseNumberOfChoices: UISegmentedControl!
    
    @IBOutlet weak var chooseNumberOfQUestions: UISegmentedControl!
    
    @IBOutlet weak var Africa: UISwitch!
    
    @IBOutlet weak var Europe: UISwitch!
    
    @IBOutlet weak var North_America: UISwitch!
    
    @IBOutlet weak var South_America: UISwitch!
    
    @IBOutlet weak var Oceania: UISwitch!
    @IBOutlet weak var Asia: UISwitch!
    
    var numberOfQuestions = 0
    var numberOfChoices = 0
    var regions:[NSString] = []
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        chooseNumberOfChoices.selectedSegmentIndex = numberOfChoices/2 - 1
        chooseNumberOfQUestions.selectedSegmentIndex = numberOfQuestions/5-1
        if !(regions.contains("Africa")) {
            println("No Africa")
            Africa.on = false
        }
        if !(regions.contains("Asia")) {
            Asia.on = false
        }
        if !(regions.contains("Europe"))
        {
            Europe.on = false
        }
        if !(regions.contains("North_America"))
        {
            North_America.on = false
        }
        if !(regions.contains("Oceania"))
        {
            Oceania.on = false
        }
        if !(regions.contains("South_America"))
        {
            South_America.on = false
        }
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSave(sender: UIBarButtonItem) {
        println("Clicked Save")
        var numberOfQuestions = (chooseNumberOfQUestions.selectedSegmentIndex + 1)*5
        var numberOfChoices = (chooseNumberOfChoices.selectedSegmentIndex+1)*2
        var regions:[String] = []
        
        if (Africa.on) {
            regions.append("Africa") }
        if (Asia.on) {
            regions.append("Asia") }
        if (Europe.on) {
            regions.append("Europe") }
        if (North_America.on) {
            regions.append("North_America") }
        if (Oceania.on) {
            regions.append("Oceania") }
        if (South_America.on) {
            regions.append("South_America") }
        
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
            defaults.setInteger(numberOfQuestions, forKey: "numberOfQuestions")
            defaults.setInteger(numberOfChoices, forKey: "numberOfChoices")
            if (regions==[])
            {
                let alertController = UIAlertController(title: "Error", message:
                    "Please select at least one region", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
                
            else {
                defaults.setObject(regions, forKey: "regions")
                }
            defaults.synchronize()
        performSegueWithIdentifier("backToStartScreen", sender: self)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension Array {
    func contains<T where T : Equatable>(obj: T) -> Bool {
        return self.filter({$0 as? T == obj}).count > 0
    }
}