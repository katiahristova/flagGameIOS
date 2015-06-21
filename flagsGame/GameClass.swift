//
//  GameClass.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/10/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class GameClass  {
    var arrayAllCountries:[String] = []
    var questionCountries:[String] = []
    var correctAnswer = ""
    var correctAnswerLocalized = ""
    var correctGuesses = 0;
    var incorrectGuesses = 0;
    var data = DataArrays()
    
    
    func loadGameQuestion(regions:[String], numberOfGuesses:Int)
    {
        
    //Get flags filename list according to regions selected
        arrayAllCountries = data.getCountriesList(regions)
        questionCountries = data.getCountriesForQuestion(numberOfGuesses, countries: arrayAllCountries)
        correctAnswer = questionCountries[data.getRandomIndex(questionCountries)]
        correctAnswerLocalized = getLocalizedName(correctAnswer)
    }
    
    
    func loadCountriesArray(regions:[String], numberOfGuesses:Int) -> [String]
    {
        arrayAllCountries = data.getCountriesList(regions)
        
        return arrayAllCountries
    }
    
    
    
    //Find the index of - in the name string, so we can remove continent name
    func findDashIndex(string:String) -> Int
    {
        let needle: Character = "-"
        if let idx = find(string, needle) {
            let pos = distance(string.startIndex, idx)
            return pos
        }
        return -1
    }
    
    //Find the localized name of the country from filename
    func getLocalizedName(str: String) -> String
    {
        var index = findDashIndex(str)
        var key = str.substringWithRange(Range<String.Index>(start: advance(str.startIndex, index+1), end: str.endIndex))
        
        return key.localized
    }
    
    
    //Create and show an end of game popup
    func showEndOfGamePopup(v:UIViewController, newGame: Int -> Bool )
    {
        var totalGuesses = correctGuesses + incorrectGuesses
        var percentCorrect:Double = Double(correctGuesses)/Double(totalGuesses)*100
        let formattedPercentCorrect = NSString(format: "%.2f", percentCorrect)
        var msg = "Game finished. " + String(totalGuesses)
        msg += " guesses. "
        msg += String(stringInterpolationSegment: formattedPercentCorrect)
        msg += "% correct."
        let alertController = UIAlertController(title: "Results", message:
            msg, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            newGame(0)
            })
        
        v.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func getFlagsName(flagName: String) -> String{
        var flagNameArray = flagName.componentsSeparatedByString("-")
        
        let myReplacementString = String(map(flagNameArray[1].generate()) {
            $0 == "_" ? " " : $0
            })
        
        return myReplacementString.uppercaseString
    }
    
    func checkFlagCharacter(character: String, flagName: String, btnArray: [UIButton]){
        
        var cntr: Int = 0
        let charac: Character = Character(character)
        for chrctr in flagName
            {
            cntr++
            if chrctr == charac{
                btnArray[cntr-1].setTitle(character, forState: UIControlState.Normal)
                
            }
        }
        
    }
    
    func isHangManCompleted(var btnArray: [UIButton]) -> Bool {
        
        for btn in btnArray {
            if btn.currentTitle == nil && btn.tag == 1 {
             return false
            }
        }
        
        return true
    }
    
    func hangManCompletedPopup(v:UIViewController, newGame:(()->())?) {
        let alertController = UIAlertController(title: "Congratulations!", message:
            "You rock!", preferredStyle: UIAlertControllerStyle.Alert)
        
    
        var dismissBtn = UIAlertAction(title: "Main Menu", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            v.navigationController!.popToRootViewControllerAnimated(true)
        }
        
        var nwGame = UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            newGame?()
        }
        
        alertController.addAction(nwGame)
        alertController.addAction(dismissBtn)
        
        v.presentViewController(alertController, animated: true, completion: nil)
    
    }
    
    func getRandomIndex(countries:[String]) -> Int {
        return Int(arc4random_uniform(UInt32(countries.count)))
    }
    
}
