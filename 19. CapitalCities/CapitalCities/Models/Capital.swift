//
//  Capital.swift
//  CapitalCities
//
//  Created by Neil Hiddink on 9/28/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import MapKit
import UIKit

// MARK: - Capital: NSObject, MKAnnotation

class Capital: NSObject, MKAnnotation {
    
    // MARK: - Properties
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    // MARK: - Initialization
    
    init(title: String, coordinate: CLLocationCoordinate2D,
         info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
