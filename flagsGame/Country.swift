//
//  Country.swift
//  flagsGame
//
//  Created by Katia Hristova on 6/13/15.
//  Copyright (c) 2015 ThraceCode Inc. All rights reserved.
//

import Foundation
import MapKit

class Country: NSObject, MKAnnotation {
    let title: String
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    let image: UIImage
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, image: UIImage) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.image = image
        super.init()
    }
    
    var subtitle: String {
        return locationName
    }
}