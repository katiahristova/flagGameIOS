//
//  HangManController.swift
//  flagsGame
//
//  Created by Sami Ali on 6/16/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class HangManController: UIViewController {
    var numberOfQuestions = Int();
    var questionCounter = 1;
    var regions:[String] = []
    var numberOfGuesses = Int();
    var game = GameClass()
    var flagName = String()
    var flagProcessedName = String()
    var buttonsArray:[UIButton] = []
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    func startNewGame(){
        game.loadGameQuestion(regions, numberOfGuesses: numberOfGuesses)
        //Set flag image
        flagName = game.correctAnswer
        flagImage.image = UIImage(named:flagName)
        flagImage.layer.borderWidth = 2
        flagProcessedName = game.getFlagsName(flagName)
        createGuessButtons()
    }
    @IBAction func loadNextFlag(sender: UIButton) {
        game.loadGameQuestion(regions, numberOfGuesses: numberOfGuesses)
        flagName = game.correctAnswer
        flagImage.image = UIImage(named:flagName)
        flagImage.layer.borderWidth = 2
        flagProcessedName = game.getFlagsName(flagName)
        deleteButtons()
        createGuessButtons()
    }

    @IBAction func keyboardButtons(sender: UIButton) {
        let letter = sender.currentTitle!
        sender.enabled = false
        if !flagProcessedName.isEmpty{
            game.checkFlagCharacter(letter, flagName: flagProcessedName, btnArray: buttonsArray)
        }
        
    }
    
    func createGuessButtons()
    {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = Int(screenSize.width)
        let screenHeight = screenSize.height
        
        var buttonYplacement = screenHeight / 2
        var buttonXplacement: Int = 0
        
        if count(flagProcessedName) > 8{
            buttonXplacement = 20
        } else {
            buttonXplacement = 20
        }
        
        println(flagProcessedName)
        var color = UIColor.darkGrayColor().colorWithAlphaComponent(0.3)
        for character in flagProcessedName
        {
            if (character == " " && count(flagProcessedName) >= 12){
                buttonYplacement += 30
                buttonXplacement = 20
            } else if (character == " "){
                color = UIColor.whiteColor()
            }
            
            let buttonLeft   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            buttonXplacement = buttonXplacement + 25
            buttonLeft.frame = CGRectMake(CGFloat(buttonXplacement), CGFloat(buttonYplacement), 20, 20)
            buttonLeft.backgroundColor = color
            
            buttonLeft.layer.cornerRadius = 5.0
            
            self.view.addSubview(buttonLeft)
            buttonsArray.append(buttonLeft)
            color = UIColor.darkGrayColor().colorWithAlphaComponent(0.3)
            
        }
    }
    
    
    func deleteButtons(){
        for b in buttonsArray {
            b.removeFromSuperview()
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
