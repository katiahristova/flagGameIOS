//
//  QuizOnlineViewController.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/13/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import UIKit
import MapKit

class QuizOnlineViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var labelQuestionNum: UILabel!
    @IBOutlet weak var buttonNext: UIButton!
    
    var buttonsArray:[UIButton] = []
    var game = GameClass()
    var numberOfGuesses = Int();
    var numberOfQuestions = Int();
    var questionCounter = 1;
    var regions:[String] = []
    var country = Country(title: "Hawaii",
        locationName: "Population",
        discipline: "Sculpture",
        coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661),
        image: UIImage())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGuessButtons()
        startNewGame(0)
        
        
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                regionRadius * 200.0, regionRadius * 200.0)
            mapView.setRegion(coordinateRegion, animated: true)
            
        }
        
        centerMapOnLocation(initialLocation)
        
        mapView.delegate = self

        // Do any additional setup after loading the view.
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
                mapView.removeAnnotation(country)
            }
            // show artwork on map
            
            
            flagView.image = nil
            
            var lat = 21.283921
            var long = -157.831661
            var address = game.correctAnswerLocalized
            var geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                if let placemark = placemarks?[0] as? CLPlacemark {
                    
                    //self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
                    lat = placemark.location.coordinate.latitude
                    long = placemark.location.coordinate.longitude
                    println(String(stringInterpolationSegment: lat) + " : " + String(stringInterpolationSegment: long))
                    println(String(stringInterpolationSegment: lat) + " : " + String(stringInterpolationSegment: long))
                    
                    self.country = Country(title: self.game.correctAnswerLocalized,
                        locationName: "Population",
                        discipline: "Sculpture",
                        coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long),
                        image: UIImage(named:self.game.correctAnswer)!)
                    let regionRadius: CLLocationDistance = 1000
                    let coordinateRegion = MKCoordinateRegionMakeWithDistance(self.country.coordinate,
                        regionRadius * 3000.0, regionRadius * 3000.0)
                    println("Changing region")
                    self.mapView.setRegion(coordinateRegion, animated: true)
                    
                    self.mapView.addAnnotation(self.country)
                    self.mapView.selectAnnotation(self.country, animated: true)
            }
            })
            
            println(String(stringInterpolationSegment: lat) + " : " + String(stringInterpolationSegment: long))

            country = Country(title: game.correctAnswerLocalized,
                locationName: "Population",
                discipline: "Sculpture",
                coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long),
                image: UIImage(named:game.correctAnswer)!)
            let regionRadius: CLLocationDistance = 1000
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(country.coordinate,
                regionRadius * 200.0, regionRadius * 200.0)
            println("Changing region")
            mapView.setRegion(coordinateRegion, animated: true)
            
            mapView.addAnnotation(country)
            mapView.selectAnnotation(country, animated: true)
            
            
        }
        else
        {
            sender.enabled = false
            game.incorrectGuesses++
        }
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
        
        return true
    }
    
    //What happens when we click Next button
    @IBAction func buttonNextClick(sender: UIButton) {
        mapView.removeAnnotation(country)
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
        var buttonYplacement = 420
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



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

