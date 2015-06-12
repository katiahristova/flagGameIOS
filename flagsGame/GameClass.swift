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
}
