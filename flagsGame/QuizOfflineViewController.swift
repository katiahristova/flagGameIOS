//
//  QuizOfflineViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/7/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit


class QuizOfflineViewController: UIViewController {
    var buttonsArray:[UIButton] = []
    var game = GameClass()
    var numberOfGuesses = 4;
    var numberOfQuestions = 5;
    var questionCounter = 1;
    var regions = ["Africa", "Asia", "Europe", "North_America", "Oceania", "South_America"]
    @IBOutlet weak var flagView: UIImageView!
    
    @IBOutlet weak var labelQuestionNum: UILabel!
    @IBOutlet weak var buttonNext: UIButton!
   
    
    @IBAction func resetButtonClick(sender: UIBarButtonItem) {
        startNewGame(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGuessButtons()
        startNewGame(0)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //What happens when we click guess buttons
    func buttonAction(sender:UIButton!)
    {
        if (sender.titleLabel?.text == game.correctAnswerLocalized)
        { buttonNext.hidden = false
            game.correctGuesses++
            if (questionCounter==numberOfQuestions)
            {
                game.showEndOfGamePopup(self, newGame: startNewGame)
            }
        }
        else
        {
            sender.enabled = false
            game.incorrectGuesses++
        }
        println(sender.titleLabel?.text)
        println("Correct answer: " + game.correctAnswerLocalized)
    }
    
    
    //Starts a new game
    func startNewGame(i:Int) -> Bool
    {
        game = GameClass()
        buttonNext.hidden = true
        questionCounter = 1
        labelQuestionNum.text = "Question " + String(questionCounter) + " of " + String(numberOfQuestions)
        buttonNext.setTitle("next".localized, forState: UIControlState.Normal)
        game.loadGameQuestion(regions, numberOfGuesses: numberOfGuesses)
        
        //Set flag image
        flagView.image = UIImage(named:game.correctAnswer)
        
        // Do any additional setup after loading the view.
        
        //Set guess buttons labels
        for var i = 0; i<numberOfGuesses; i++
        {
            setButtonLabel(game.questionCountries[i],button: buttonsArray[i])
            
        }

        println("Function was called")
        return true
    }
    
    //What happens when we click Next button
    
    @IBAction func buttonNextClick(sender: UIButton) {
        println("NQ click")
        game.loadGameQuestion(regions, numberOfGuesses: numberOfGuesses)
        flagView.image = UIImage(named:game.correctAnswer)
        questionCounter++
        for var i = 0; i<numberOfGuesses; i++
        {
            setButtonLabel(game.questionCountries[i],button: buttonsArray[i])
        }
        labelQuestionNum.text = "Question " + String(questionCounter) + " of " + String(numberOfQuestions)
        buttonNext.hidden = true
        
        
        //Iterate through flags when Next button is clicked
        /* flagView.image = UIImage(named:arrayAllCountries[index])
        
        if (index < arrayAllCountries.count-1)
        {
        index++ }
        else
        {
        index=0 }*/
    }
    

    
    //Creates buttons with guesses
    func createGuessButtons()
    {
        var buttonYplacement = 400
        for var i = 0; i<numberOfGuesses/2; i++
        {
            let buttonLeft   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            buttonLeft.frame = CGRectMake(40, CGFloat(buttonYplacement), 120, 50)
            buttonLeft.backgroundColor = UIColor.yellowColor()
            buttonLeft.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(buttonLeft)
            buttonsArray.append(buttonLeft)
            
            let buttonRight   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            buttonRight.frame = CGRectMake(200, CGFloat(buttonYplacement), 120, 50)
            buttonRight.backgroundColor = UIColor.yellowColor()
            buttonRight.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(buttonRight)
            buttonsArray.append(buttonRight)
            
            buttonYplacement += 60
        }
    }
    
    //Sets a label to a button, gets label from string resources
    func setButtonLabel(countryName:String, button:UIButton)
    {
        var key = game.getLocalizedName(countryName)
        button.setTitle(key.localized, forState: UIControlState.Normal)
        button.enabled = true
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


extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}

