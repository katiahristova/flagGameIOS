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
    
    func loadGameQuestion(regions:[String], numberOfGuesses:Int)
    {
        var data = DataArrays()
    //Get flags filename list according to regions selected
        arrayAllCountries = data.getCountriesList(regions)
        questionCountries = data.getCountriesForQuestion(numberOfGuesses, countries: arrayAllCountries)
        correctAnswer = questionCountries[data.getRandomIndex(questionCountries)]
        correctAnswerLocalized = getLocalizedName(correctAnswer)
    }
    
    
    //Find the index of - in the name string, so we can remove continent name
    func findDashIndex(string:String) -> Int
    {
        let needle: Character = "-"
        if let idx = find(string, needle) {
            let pos = distance(string.startIndex, idx)
            //println("Found \(needle) at position \(pos)")
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
    func showEndOfGamePopup(v:UIViewController)
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
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        alertController.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default,handler: nil))
        v.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
