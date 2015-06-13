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
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
                
            }
            return view
        }
        return nil
    }
}