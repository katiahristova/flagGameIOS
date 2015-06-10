//
//  QuizOfflineViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/7/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit

class QuizOfflineViewController: UIViewController {
    var arrayAfrica = [""]
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

        var data = DataArrays()
        
        //Set regions for the game
        var regions = ["Africa", "Asia"]
        //Get flags filename list according to regions selected
        arrayAfrica = data.getAfricaList(regions)
        
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
