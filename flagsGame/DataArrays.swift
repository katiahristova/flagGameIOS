//
//  DataArrays.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/9/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class DataArrays {
    
    var arrayAfrica = ["Africa-Algeria", "Africa-Madagascar", "Africa-Angola", "Africa-Malawi","Africa-Benin", "Africa-Mali", "Africa-Botswana", "Africa-Mauritania", "Africa-Burkina_Faso", "Africa-Mauritius", "Africa-Burundi", "Africa-Morocco", "Africa-Cameroon", "Africa-Mozambique", "Africa-Cape_Verde", "Africa-Namibia", "Africa-Central_African_Republic",	"Africa-Niger", "Africa-Chad", "Africa-Nigeria", "Africa-Comoros", "Africa-Republic_Of_Congo", "Africa-DRO_Congo", "Africa-Rwanda", "Africa-Djibouti", "Africa-Sao_Tome", "Africa-Egypt",	"Africa-Senegal", "Africa-Equatorial_Guinea", "Africa-Seychelles", "Africa-Eritrea", "Africa-Sierra_Leone", "Africa-Ethiopia",	"Africa-Somalia", "Africa-Gabon",	"Africa-South_Africa", "Africa-Gambia", "Africa-Sudan", "Africa-Ghana", "Africa-Swaziland", "Africa-Guinea", "Africa-Tanzania", "Africa-Guinea_Bissau",	"Africa-Togo", "Africa-Ivory_Coast", "Africa-Tunisia", "Africa-Kenya",	"Africa-Uganda", "Africa-Lesotho", "Africa-Zambia", "Africa-Liberia", "Africa-Zimbabwe", "Africa-Libya"]
    
    var arrayAsia = ["Asia-Afghanistan", "Asia-Armenia", "Asia-Azerbaijan", "Asia-Bahrain", "Asia-Bangladesh", "Asia-Bhutan", "Asia-Brunei", "Asia-Cambodia", "Asia-China", "Asia-Christmas_Island", "Asia-Hong_Kong", "Asia-India", "Asia-Indonesia","Asia-Iran","Asia-Iraq", "Asia-Israel", "Asia-Japan", "Asia-Jordan", "Asia-Kazakhstan", "Asia-Kuwait", "Asia-Kyrgyzstan", "Asia-Laos","Asia-Lebanon", "Asia-Macao","Asia-Malaysia", "Asia-Maldives","Asia-Mongolia","Asia-Myanmar","Asia-Nepal","Asia-North_Korea","Asia-Oman","Asia-Pakistan", "Asia-Philippines", "Asia-Qatar", "Asia-Republic_Of_Georgia", "Asia-Saudi_Arabia", "Asia-Singapore", "Asia-South_Georgia_And_The_South_Sandwich_Islands", "Asia-South_Korea","Asia-Sri_Lanka", "Asia-Syria", "Asia-Taiwan", "Asia-Tajikistan", "Asia-Thailand", "Asia-Tibet", "Asia-Timor_Leste", "Asia-Turkey", "Asia-Turkmenistan", "Asia-UAE", "Asia-Uzbekistan", "Asia-Vietnam", "Asia-Yemen"]
    
    var arrayEurope = ["Europe-Albania", "Europe-Latvia", "Europe-Andorra", "Europe-Liechtenstein", "Europe-Austria", "Europe-Lithuania", "Europe-Belarus", "Europe-Luxembourg", "Europe-Belgium", "Europe-Macedonia", "Europe-Bosnia_Herzegovina", "Europe-Malta", "Europe-Bulgaria", "Europe-Moldova", "Europe-Croatia", "Europe-Monaco", "Europe-Cyprus", "Europe-Netherlands", "Europe-Cyprus_North", "Europe-Norway", "Europe-Czech_Republic", 	"Europe-Poland", "Europe-Denmark", "Europe-Portugal", "Europe-Estonia", "Europe-Romania", "Europe-Faroe_Islands", "Europe-Russia", "Europe-Finland", "Europe-San_Marino", "Europe-France", "Europe-Serbia","Europe-Germany", 	"Europe-Slovakia", "Europe-Gibraltar", "Europe-Slovenia", "Europe-Greece", "Europe-Spain", "Europe-Greenland", "Europe-Sweden", "Europe-Hungary", 	"Europe-Switzerland", "Europe-Iceland", "Europe-Ukraine", "Europe-Ireland", "Europe-United_Kingdom", "Europe-Italy", "Europe-Vatican_City"]
    var arrayNorth_America = ["North_America-Anguilla", "North_America-Antigua", "North_America-Aruba", "North_America-Bahamas", "North_America-Barbados", "North_America-Belize", "North_America-Bermuda", "North_America-British_Virgin_Islands", "North_America-Canada", "North_America-Cayman_Islands", "North_America-Costa_Rica", "North_America-Cuba", "North_America-Dominica", "North_America-Dominican_Republic", "North_America-El_Salvador", "North_America-Grenada", "North_America-Guatemala", "North_America-Haiti", "North_America-Honduras", "North_America-Jamaica", "North_America-Martinique", "North_America-Mexico", "North_America-Montserrat", "North_America-Nicaragua", "North_America-Panama", "North_America-Puerto_Rico", "North_America-Saint_Kitts", "North_America-Saint_Lucia", "North_America-Saint_Vincent_and_the_Grenadines", "North_America-Turks_Islands", "North_America-USA", "North_America-US_Virgin_Islands"]
    var arrayOceania = ["Oceania-Am._Samoa", "Oceania-Niue", "Oceania-Australia", "Oceania-Norfolk_Island", "Oceania-Cook_Islands", "Oceania-Palau", "Oceania-Fiji", "Oceania-Pitcairn_Islands", "Oceania-Guam", "Oceania-Samoa", "Oceania-Kiribati", "Oceania-Solomon_Islands", "Oceania-Marshall_Islands", "Oceania-Tonga", "Oceania-Micronesia"	, "Oceania-Tuvalu", "Oceania-Nauru", "Oceania-Vanuatu", "Oceania-New_Guinea", "Oceania-Wallis_and_Futuna", "Oceania-New_Zealand"]
    var arraySouth_America = ["South_America-Argentina", "South_America-Fr_Polynesia", "South_America-Bolivia", "South_America-Guyana", "South_America-Brazil", "South_America-Paraguay", "South_America-Chile", "South_America-Peru", "South_America-Colombia", "South_America-Suriname", "South_America-Dutch_Antilles", "South_America-Trinidad_Tobago", "South_America-Ecuador", "South_America-Uruguay", "South_America-Falkland_Is", "South_America-Venezuela"]

    func getCountriesList(regions:[String]) -> [String] {
        var arrayToReturn:[String] = []
        if (contains(regions,"Africa"))
        {
            arrayToReturn += arrayAfrica }
        if (contains(regions,"Asia"))
        {
            arrayToReturn += arrayAsia
        }
        if (contains(regions,"Europe"))
        {
            arrayToReturn += arrayEurope
        }
        if (contains(regions,"North_America"))
        {
            arrayToReturn += arrayNorth_America
        }
        if (contains(regions,"Oceania"))
        {
            arrayToReturn += arrayOceania
        }
        if (contains(regions,"South_America"))
        {
            arrayToReturn += arraySouth_America
        }
        
        return arrayToReturn }
    
    func getRandomIndex(countries:[String]) -> Int {
        return Int(arc4random_uniform(UInt32(countries.count)))
    }
    
    func getCountriesForQuestion(number:Int, countries:[String]) -> [String]
    {
        var questionCountries:[String] = []
        while questionCountries.count<number
        {
            var newCountry = countries[number]
            while contains(questionCountries,newCountry)
            { newCountry = countries[getRandomIndex(countries)] }
            questionCountries.append(newCountry)
            
        }
        return questionCountries
    }
        
    
}
