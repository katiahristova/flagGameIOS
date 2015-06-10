//
//  QuizOfflineViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/7/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class QuizOfflineViewController: UIViewController {
    var arrayAfrica = [""]
    var index = 0
    @IBOutlet weak var flagView: UIImageView!
    
    @IBAction func nextButtonClick(sender: UIButton) {
        
        flagView.image = UIImage(named:arrayAfrica[index])
        if (index < arrayAfrica.count-1)
        {
            index++ }
        else
        {
            index=0 }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var data = DataArrays()
        
        //Set regions for the game
        var regions = ["Africa", "Asia", "Europe"]
        var numberOfGuesses = 6;
        
        //Get flags filename list according to regions selected
        arrayAfrica = data.getCountriesList(regions)
        
        // Do any additional setup after loading the view.
        
        var buttonYplacement = 400
        for var i = 0; i<numberOfGuesses/2; i++
        {
            let buttonLeft   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            buttonLeft.frame = CGRectMake(40, CGFloat(buttonYplacement), 120, 50)
            buttonLeft.backgroundColor = UIColor.yellowColor()
            buttonLeft.setTitle("Test Button", forState: UIControlState.Normal)
            buttonLeft.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(buttonLeft)
        
            let buttonRight   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            buttonRight.frame = CGRectMake(200, CGFloat(buttonYplacement), 120, 50)
            buttonRight.backgroundColor = UIColor.yellowColor()
            buttonRight.setTitle("Test Button", forState: UIControlState.Normal)
            buttonRight.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(buttonRight)
            
            buttonYplacement += 60
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func buttonAction(sender:UIButton!)
    {
        println("Button tapped")
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
