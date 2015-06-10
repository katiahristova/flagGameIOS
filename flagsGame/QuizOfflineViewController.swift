//
//  QuizOfflineViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/7/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class QuizOfflineViewController: UIViewController {
    var arrayAfrica = ["Africa-Algeria", "Africa-Madagascar",
        "Africa-Angola", "Africa-Malawi","Africa-Benin",
        "Africa-Mali", "Africa-Botswana", "Africa-Mauritania",
        "Africa-Burkina_Faso", "Africa-Mauritius",
        "Africa-Burundi", "Africa-Morocco",
    "Africa-Cameroon", "Africa-Mozambique",
        "Africa-Cape_Verde", "Africa-Namibia",
    "Africa-Central_African_Republic",	"Africa-Niger",
    "Africa-Chad", "Africa-Nigeria",
    "Africa-Comoros", "Africa-Republic_Of_Congo",
    "Africa-DRO_Congo",			"Africa-Rwanda",
    "Africa-Djibouti",			"Africa-Sao_Tome",
    "Africa-Egypt",			"Africa-Senegal",
    "Africa-Equatorial_Guinea",		"Africa-Seychelles",
    "Africa-Eritrea",			"Africa-Sierra_Leone",
    "Africa-Ethiopia",			"Africa-Somalia",
    "Africa-Gabon",			"Africa-South_Africa",
    "Africa-Gambia",			"Africa-Sudan",
    "Africa-Ghana",			"Africa-Swaziland",
    "Africa-Guinea",			"Africa-Tanzania",
    "Africa-Guinea_Bissau",		"Africa-Togo",
    "Africa-Ivory_Coast",			"Africa-Tunisia",
    "Africa-Kenya",			"Africa-Uganda",
    "Africa-Lesotho",			"Africa-Zambia",
    "Africa-Liberia",			"Africa-Zimbabwe",
    "Africa-Libya"]
    
    var index = 0
    @IBOutlet weak var flagView: UIImageView!
    
    @IBAction func nextButtonClick(sender: UIButton) {
        
        flagView.image = UIImage(named:arrayAfrica[index])
        if (index < arrayAfrica.count-1)
        {
            index++ }
        else
        {
            index=0 }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
