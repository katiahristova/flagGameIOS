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
    var questionCounter = Int();
    var regions:[String] = []
    var numberOfGuesses = Int();
    var game = GameClass()
    var flagName = String()
    var flagProcessedName = String()
    var buttonsArray:[UIButton] = []
    var lettersArray: [UIButton] = []
    var gameOver: Bool = false
    var loadedCountriesArray: [String] = []
    var randomInt: Int = 0
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var labelQuestionNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.hidden = true
        startNewGame()
        
        // Do any additional setup after loading the view.
        customBackBtn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func startNewGame(){
        questionCounter = 1
        labelQuestionNum.text = "Question " + String(questionCounter) + " of " + String(numberOfQuestions)
        
        loadedCountriesArray = game.loadCountriesArray(regions, numberOfGuesses: numberOfGuesses)
        
        randomInt = game.getRandomIndex(loadedCountriesArray)
        flagName = loadedCountriesArray.removeAtIndex(randomInt)
        
        flagImage.image = UIImage(named:flagName)
        flagImage.layer.borderWidth = 2
        flagProcessedName = game.getFlagsName(flagName)
        createGuessButtons()
        
    }
    @IBAction func loadNextFlag(sender: UIButton) {
        randomInt = game.getRandomIndex(loadedCountriesArray)
        println(loadedCountriesArray)
        flagName = loadedCountriesArray.removeAtIndex(randomInt)
        flagImage.image = UIImage(named:flagName)
        flagImage.layer.borderWidth = 2
        flagProcessedName = game.getFlagsName(flagName)
        deleteButtons()
        createGuessButtons()
        nextButton.hidden = true
        gameOver = false
        labelQuestionNum.text = "Question " + String(questionCounter) + " of " + String(numberOfQuestions)
        
    }

    @IBAction func keyboardButtons(sender: UIButton) {
        let letter = sender.currentTitle!
        
        if !gameOver {
            sender.enabled = false
            lettersArray.append(sender)
            if !flagProcessedName.isEmpty{
                game.checkFlagCharacter(letter, flagName: flagProcessedName, btnArray: buttonsArray)
            }

        }
        if game.isHangManCompleted(buttonsArray){
            if numberOfQuestions < ++questionCounter {
                game.hangManCompletedPopup(self, newGame: startNewGame)
                deleteButtons()
            } else {
            nextButton.hidden = false
            gameOver = true
            }
        }
    }
    
    func createGuessButtons()
    {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = Int(screenSize.width)
        let screenHeight = screenSize.height
        
        var buttonYplacement = screenHeight / 2 - 10
        var buttonXplacement: Int = 0

        
        if count(flagProcessedName) > 8{
            buttonXplacement = 20
        } else {
            buttonXplacement = 60
        }
        
        println(flagProcessedName)
        var color = UIColor.darkGrayColor().colorWithAlphaComponent(0.3)
        
        for character in flagProcessedName
        {
            let buttonLeft   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            //not empty button by default
            buttonLeft.tag = 1
            
            if (character == " " && count(flagProcessedName) >= 12){
                buttonYplacement += 30
                buttonXplacement = -5
                color = UIColor.whiteColor()
                //represents empty button
                buttonLeft.tag = 0
            } else if (character == " "){
                color = UIColor.whiteColor()
                buttonLeft.tag = 0
            }
            
            // not empty button
            
            buttonXplacement += 25
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
        
        for l in lettersArray {
            l.enabled = true
        }
        buttonsArray.removeAll(keepCapacity: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func customBackBtn() {
        self.navigationController!.setNavigationBarHidden(false, animated:true)
        var myBackButton:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        myBackButton.addTarget(self, action: "popToRoot:", forControlEvents: UIControlEvents.TouchUpInside)
        myBackButton.setTitle("Back", forState: UIControlState.Normal)
        myBackButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        myBackButton.sizeToFit()
        var myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
    }
    func popToRoot(sender:UIBarButtonItem){
        self.navigationController!.popToRootViewControllerAnimated(true)
    }

}
