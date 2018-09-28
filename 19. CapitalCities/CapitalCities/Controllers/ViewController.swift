//
//  ViewController.swift
//  CapitalCities
//
//  Created by Neil Hiddink on 9/18/18.
//  Copyright © 2018 Neil Hiddink. All rights reserved.
//

import UIKit
import MapKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Properties
    
    let capitals: [Capital] = [Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                                       info: "Home to the 2012 Summer Olympics."),
                               Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75),
                                       info: "Founded over a thousand years ago."),
                               Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508),
                                       info: "Often called the City of Light."),
                               Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5),
                                       info: "Has a whole country inside it."),
                               Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667),
                                       info: "Named after George himself.")]
    
    // MARK: IB Outlets
    
    @IBOutlet var mapView: MKMapView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addAnnotations(capitals)
    }


}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Capital"
        if annotation is Capital {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                let button = UIButton(type: .detailDisclosure)
                annotationView!.rightCalloutAccessoryView = button
            } else {
                annotationView!.annotation = annotation
            }
            
            return annotationView
        }
        
        return nil
    }
}

