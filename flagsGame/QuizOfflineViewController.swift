//
//  QuizOfflineViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/7/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class QuizOfflineViewController: UIViewController {
    var arrayAllCountries = [""]
    var index = 0
    @IBOutlet weak var flagView: UIImageView!
    
    @IBAction func nextButtonClick(sender: UIButton) {
        
        flagView.image = UIImage(named:arrayAllCountries[index])
        if (index < arrayAllCountries.count-1)
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
        arrayAllCountries = data.getCountriesList(regions)
        
        var questionCountries = data.getCountriesForQuestion(numberOfGuesses, countries: arrayAllCountries)
        var correctAnswer = questionCountries[data.getRandomIndex(questionCountries)]
        println(correctAnswer)
        
        
        // Do any additional setup after loading the view.
        
        var buttonYplacement = 400
        var nextLabel = 0
        for var i = 0; i<numberOfGuesses/2; i++
        {
            let buttonLeft   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            buttonLeft.frame = CGRectMake(40, CGFloat(buttonYplacement), 120, 50)
            buttonLeft.backgroundColor = UIColor.yellowColor()
            buttonLeft.setTitle(questionCountries[nextLabel], forState: UIControlState.Normal)
            nextLabel++
            buttonLeft.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(buttonLeft)
        
            let buttonRight   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            buttonRight.frame = CGRectMake(200, CGFloat(buttonYplacement), 120, 50)
            buttonRight.backgroundColor = UIColor.yellowColor()
            buttonRight.setTitle(questionCountries[nextLabel], forState: UIControlState.Normal)
            nextLabel++
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
