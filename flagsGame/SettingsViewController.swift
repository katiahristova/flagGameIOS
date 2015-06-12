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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        println(regions)
        
        
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
