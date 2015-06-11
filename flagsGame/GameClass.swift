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
    
    
    func loadGameQuestion(regions:[String], numberOfGuesses:Int)
    {
        var data = DataArrays()
    //Get flags filename list according to regions selected
        arrayAllCountries = data.getCountriesList(regions)
        questionCountries = data.getCountriesForQuestion(numberOfGuesses, countries: arrayAllCountries)
        correctAnswer = questionCountries[data.getRandomIndex(questionCountries)]
    }
}
