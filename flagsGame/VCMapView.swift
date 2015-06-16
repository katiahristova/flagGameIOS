//
//  VCMapView.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/13/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import Foundation
import MapKit

extension QuizOnlineViewController: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? Country{
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
                    button.frame = CGRectMake(60, 30, 60, 30)
                    button.setBackgroundImage(annotation.image, forState: .Normal)
                    dequeuedView.leftCalloutAccessoryView = button
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -25, y: 5)
                let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
                button.frame = CGRectMake(60, 30, 60, 30)
                button.setBackgroundImage(annotation.image, forState: .Normal)
                view.leftCalloutAccessoryView = button
                //view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
                
            }
            return view
        }
        return nil
    }
}