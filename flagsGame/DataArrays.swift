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

    func getAfricaList(regions:[String]) -> [String] {
        var arrayToReturn:[String] = []
        if (contains(regions,"Africa"))
        {
            arrayToReturn += arrayAfrica }
        if (contains(regions,"Asia"))
        {
            arrayToReturn += arrayAsia
        }
        return arrayToReturn }
    
}
